# pivotal-bootstrap

This gem provides a command-line application, "pivotal-bootstrap", which
imports stories from one or more YAML files into Pivotal Tracker.

The command makes it easy to bootstrap new projects with a common set of
pre-canned stories or to quickly capture stories in a text file for later
import.

YAML files contain grouped stories, allowing you to choose which groups to import.
This is useful when bootstrapping a new Pivotal project with common stories,
since every group of stories may not be applicable to every type of project
(see the example stories.yml for an instance of this).

## Installation

Run

    $ gem install pivotal-bootstrap

Retrieve a Pivotal Tracker API token from https://www.pivotaltracker.com/profile

You may specify this token on the command line or place it in ~/.pivotal_tracker
for easier reuse.  ~/.pivotal_tracker should look like this:

    token: your_token_here

## Usage

To retrieve a list of available arguments, run

    $ pivotal-bootstrap --help

By default, the application reads stories from stories.yml in the current directory.
If you have your stories in stories.yml and your token in ~/.pivotal_tracker as
described above, simply run

    $ pivotal-bootstrap --project=$PROJECT_ID

Where $PROJECT_ID is the ID of the pivotal project contained in the project's URL.

The application will ask you which groups of stories to import.  You may also specify
groups on the command line:

    $ pivotal-bootstrap --project=$PROJECT_ID --groups=group1 group2

or you can import all the stories:

    $ pivotal-bootstrap --project=$PROJECT_ID --all

Another example providing an API token and a project ID, importing all stories from
multiple files:

   $ pivotal-bootstrap --token=$PIVOTAL_TOKEN --project=$PROJECT_ID --all some_stories.yml other_stories.yml


## Sample YAML stories file:

    # Sample stories to import into Pivotal Tracker when first creating a project

    # The top level specifies a group.  The CLI allows you to specify which groups
    # to import or interactively select groups using these keys.  By default, this
    # string is used as a label for each item in the group.
    project:

      # Within each group, you may include a list of chores, features, releases,
      # and/or bugs to import (all optional).
      chores:
        # Each story type contains a list of stories.  If these are strings, they
        # represent the story name.
        - Set up git project
        - Set up customer Pivotal accounts

        # You may also specify more fields for the story.  The field names match
        # those provided by the Pivotal API
        - name: Set up tests
          labels: project, tests       # Multiple labels are separated by commas
          description: >-              # Use YAML syntax for multi-line strings
            Set up automated testing within the project and a TeamCity build to run
            the tests.
      features:
        - Design user interface
      releases:
        - Release v1.0

    ios-project:
      labels: project
      chores:
        - Provision customer devices
        - Submit app for review
      features:
        - Add analytics to the project

    web-project:
      labels: project
      chores:
        - Set up staging server
        - Set up production server

    accounts:
      features:
        - Create account
        - Log in
        - Log out
        - Change password
        - Recover password
        - Show user account information
        - Update user account information


