@echo off

aws cloudformation create-stack 
--stack-name WordPressPostigo 
--template-body tarea.yml
--region us-east-1
