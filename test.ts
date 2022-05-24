const { createLogger, format, transports } = require('winston');
const { combine, timestamp, printf, label } = format;

const myFormat = printf(({ level, message, label, timestamp }) => {
    return `${timestamp} ${label} [${level}]: ${message}`;
});

export const getLogger = (className: any) => {
    const logger = createLogger({
        level: getEnvValue(EnvConstants.LOG_LEVEL),
        format: combine(
            label({ label: className }),
            timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
            myFormat
        ),
        transports: [
            //
            // - Write all logs with level `error` and below to `error.log`
            // - Write all logs with level `info` and below to `combined.log`
            //
            new transports.File({ filename: 'error.log', level: 'error' }),
            new transports.File({ filename: 'combined.log' }),
        ],
    });
    return logger;
}
