# README

## Action Cable

```
data = {:notification=>"You have to water your plant", :time=>"05:17, 02/08/2018", :user_id=>2}

BroadcastNotificationJob.perform_now(data)
```


## Run crone jobs with whenever gem

```
$ whenever --update-crontab planted
```
