from prefect import (
  prefect,
  task,
  Flow
)

@task
def hello_world():
    logger = prefect.context.get('logger')
    logger.info('hello world')
    return('hello world')

with Flow('hello-world') as flow:
    h = hello_world()
    flow.add_task(h)

if __name__ == '__main__':
    flow.run()
