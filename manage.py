#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys


def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)

# this enables listener that waits for debugger to attach before proceeding, haven't been able to make work yet against container hosted process
# or if you don't need to attach during startup can enable without a code change using 'python -m debugpy --listen 5678 manage.py runserver' from command line or entrypoint.sh
# see https://code.visualstudio.com/docs/python/debugging, https://github.com/microsoft/debugpy/wiki/api-reference and https://pypi.org/project/debugpy/
def enable_debugger_attach():
    # import debugpy; debugpy.listen(5678); print("Waiting for debugger attach"); debugpy.wait_for_client(); debugpy.breakpoint(); print('break on this line')
    import debugpy
    if not debugpy.is_client_connected(): # or not 'debugpy_listener_enabled' in os.environ or not os.environ['debugpy_listener_enabled'] == 'True':
        debugpy.listen(5678) # 5678 is the default attach port in the VS Code debug configurations. Unless a host and port are specified, host defaults to 127.0.0.1
        os.environ['debugpy_listener_enabled'] = 'True'
        print("Waiting for debugger attach")
        debugpy.wait_for_client()
        debugpy.breakpoint()
        print('break on this line')

if __name__ == '__main__':
    # import sys; sys.path.append("mysite"); import settings
    # if settings.DEBUG:
    #     enable_debugger_attach()
    main()
