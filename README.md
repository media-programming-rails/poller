# README

Poller is a rails polling app. It is intented to enable anonymous polls that consist of an arbitrary rails resource. Therefore, basic programming and Ruby on Rails knowledge is required to use it.

It supports anonymous Polls by sending out emails with a one-time
poll participation hash.

Emails can either be sent out by the app if a list of emails is provided
or a list of participation hashes can be copied and sent out by a script
(to avoid sending emails out to another, possibly us-based, computer).

1. (story 1) Poll creation: Admin can create polls by specifying the maximimum number of participants. A list of participation hashes will be shown to the Admin
2. (story 2) A script is provided to the admin to send out the participation hashes from a local computer.

2. Poll participation:
4. Poll results: The poll page shows the poll results either
    - instantly; that is, all received votes


2. Poll creation with emails: an admin can paste a list of emails to the poll, participation hashes are sent out atomatically to all emails. Email adresses will not be stored, only a salted hash to ensure that each email only gets to participate once.
3. Poll participation: Participants receive an email with an url including the participation hash which leads directly to the poll participation page.
4. Poll results: The poll page shows the poll results either
    - instantly; that is, all received votes
    - only after the poll is closed
    - publicly or
    - only the participants (using their participation hash)
    - (only the admin)
5. Polls are defined through Rails resources, that is, every participant creates an instances of a specific resource for participation. Polls are therefore defined through Rails Resources, requiring some programming knowledge, but allowing for flexible definition of polls.

## Implementation Roadmap

- 1.a. create polls showing a list of participation hashes.
