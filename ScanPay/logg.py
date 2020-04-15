import logging.config
from datetime import datetime, date



UNSPECIFIED = 'unspecified'
__project_name__ = UNSPECIFIED


def setup_logging(project_name: str):
    global __project_name__
    if __project_name__ != UNSPECIFIED:
        raise RuntimeError(f'Setup should be called only once!')
    __project_name__ = project_name

    utc_time = datetime.utcnow().isoformat(timespec='seconds')
    log_filename = f'log/{utc_time}.log'.replace(':', '_')

    logging.config.fileConfig('logging.ini', defaults={'args': (log_filename, 'a', 'utf-8')})
    log = logging.getLogger(__name__)
    return log
