import * as fs from 'fs';
import os = require('os');
import path = require('path');
import process from 'process';
import * as tl from 'azure-pipelines-task-lib/task';
import * as tr from 'azure-pipelines-task-lib/toolrunner';

function getPathToUploadAndCreateTarIfNeeded(
    pathToPublish: string,
    shouldStoreAsTar: boolean,
    artifactName: string
): string {
    if (!shouldStoreAsTar) {
        return pathToPublish;
    }

    return createTarArchive(pathToPublish, artifactName);
}

/**
 * Creates plain (not compressed) tar archive from files located in `filesPath`.
 * `filesPath` input may contain a file or a folder with files.
 * Puts created tar file to temp directory ($(Agent.TempDirectory)/`artifactName`.tar).
 * 
 * @param filesPath path to a file or a directory of files to add to a tar archive
 * @param artifactName the name of the artifact. This will be used to determine tar archive name
 * @returns string
 */
 function createTarArchive(filesPath: string, artifactName: string): string {
    const tar: tr.ToolRunner = tl.tool(tl.which('tar', true));
    const tempDir = tl.getVariable('Agent.TempDirectory');
    let outputFilePath: string = '';
    if(tempDir !== undefined) {
        outputFilePath = path.join(tempDir, `${artifactName}.tar`);

        if (tl.stats(filesPath).isFile()) {
            // If filesPath is a file, we only have to add a single file
            tar.arg(['cf', outputFilePath, '--directory', path.dirname(filesPath), path.basename(filesPath)]);
        } else {
            // If filesPath is a directory, we have to add all files from that directory to the tar archive
            tar.arg(['cf', outputFilePath, '--directory', filesPath, '.']);
        }

        const tarExecResult: tr.IExecSyncResult = tar.execSync();

        if (tarExecResult.error || tarExecResult.code !== 0) {
            throw new Error(`Couldn't add artifact files to a tar archive: ${tarExecResult.error}`);
        }
    }
    return outputFilePath;
}

export default class DSOEUtil {
    public static publishArtifact(pathToPublish: string) {
        try {
            tl.setResourcePath(path.join(__dirname, 'task.json'));
    
            const shouldStoreAsTar: boolean = tl.getBoolInput('StoreAsTar');
            const isWindows = os.platform() === 'win32';
            if (isWindows && shouldStoreAsTar) {
                tl.setResult(tl.TaskResult.Failed, tl.loc('TarExtractionNotSupportedInWindows'));
                return;
            }
    
            // pathToPublish is a folder or a single file that may be added to a tar archive later
            const artifactName: string = "CodeQL_Result";
    
            // pathToUpload is an actual folder or file that will get uploaded
            const pathToUpload: string = getPathToUploadAndCreateTarIfNeeded(pathToPublish, shouldStoreAsTar, artifactName);

            let hostType = tl.getVariable('system.hostType');
            if ((hostType && hostType.toUpperCase() != 'BUILD')) {
                tl.setResult(tl.TaskResult.Failed, tl.loc('ErrorHostTypeNotSupported'));
                return;
            }

            const artifactType: string = "container";
            let data: any = {
                artifacttype: artifactType,
                artifactname: artifactName
            };

            data["containerfolder"] = artifactName;

            // add localpath to ##vso command's properties for back compat of old Xplat agent
            data["localpath"] = pathToUpload;
            tl.command("artifact.upload", data, pathToUpload);
        } catch (err: any) {
            tl.setResult(tl.TaskResult.Failed, tl.loc('PublishBuildArtifactsFailed', err.message));
        }
    }
}