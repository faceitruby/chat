# Project Chat
Use slack as UI and functional examples

**TERMS:**
* _public conversation_ - conversation where anyone can freely join
* _private conversation_ - conversation created by a user and where other users can be invited by creator or any other conversation memeber
* _delete\archive_ - meaning soft delete
## General requirements
1. Should works without page reloading via web sockets
1. Per-to-per conversations
1. Group conversations(public and private)
1. Supporting attachments
1. Supporting emoji
1. Supporting images preview

## Requirements

### Admin area
TODO
### User area
User fields: first_name, last_name, email

User should confirm his email. Unconfirmed user should not be able to login
#### User can:
##### Account area:
* Register using email and google account
* Login via email or google account
* Delete(archive) own account
* Edit own account
* View\Edit contact list
##### General:
* Search other users
* Add other user to contact list (approval needed)
* Block\Unblock user. Blocked user should not be able to create conversations and invite to groups
##### Conversation area:
* Create conversation with other user from contact list
* Create public conversation with other users from contact list
* Create private conversation with other users from contact list
* Delete(archive) own conversation
* Invite users from contact list to private conversation
* Kick users from own private conversation
* Block users to not allow them to join conversation
* Turn notification on\off (mute)
* Conversation has user roles:
  * Owner - can assign moderators, invite and kick users.
  * Moderator - can invite and kick users.
  * Member - can invite users.
* Sent message
* Delete message
* Leave from conversation
##### Notifications creates when 
* invite received 
* invite declined
* someone has left conversation
* user has unread messages more than 30 minutes
* user assigned as moderator
* user was kicked

## Additional

Messages in visible conversation area should automatically marked as readed.

Archive conversation should be automatically deleted after 3 months

Notification email should be sent to user(with all things user missed) in case if one or more notifications was not readed in 1 hour.

## Tech stack:
* rails 6
* ruby 2.6.3
* postgresql
* resque for background jobs
* ActiveStorage for attachments
* ActionCable as sockets implementation
* Devise for authentication
* Bootstrap as frontend framework
* Pundit for authorization
* Rspec for tests
