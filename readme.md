# Mirror

A minimalistic bash script to update a git mirror, that will never hammer the mirror.

## How to use

In order to use the script, the local repository must have the remotes `origin` and `mirror` available.
Either run the script manually each time, or set up a cronjob to run the script and mirror the repository.

### Recommendation

It is recommended to set up a service to run this script automatically.