"""DAG demo"""

import datetime

import pendulum

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.empty import EmptyOperator
from airflow.models import Variable

default_args = {
    'email': [Variable.get('TO_EMAIL_ON_FAILURE', '')],
    'email_on_failure': Variable.get('EMAIL_ON_FAILURE_ON', False),
}
params = {
    'priority':'HIGH',
    'env':Variable.get('ENVIRONMENT', 'LOCAL'),
    'batch_name':'demo',
}

with DAG(
    dag_id='demo',
    schedule_interval='0/5 * * * *',
    start_date=pendulum.datetime(2025, 1, 1, tz="UTC"),
    catchup=False,
    max_active_runs=1,
    dagrun_timeout=datetime.timedelta(minutes=60*12),
    tags=[Variable.get('ENVIRONMENT', 'LOCAL'), 'demo'],
) as dag:

    start = EmptyOperator(
        task_id='start'
    )
    end = EmptyOperator(
        task_id='end'
    )

    demo = BashOperator(
        task_id='demo',
        bash_command='php /opt/airflow/artisan app:demo'
    )

    start >> demo >> end

if __name__ == "__main__":
    dag.cli()
