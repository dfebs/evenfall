# Evenfall
A Ruby on Rails web app for group chats.

## Requirements
- Ruby Version: 3.4.3 or newer
- Rails 8

## How to set up and run
```
git clone https://github.com/dfebs/evenfall.git
cd evenfall
bundle install
bin/rails db:setup
bin/rails server
```

## Notes and todo

- [x] Make a navbar
- [x] Try and get the chat box to scroll when sending or receiving a message
- [x] Globally prevent mobile from zooming in when pressing selecting text fields
- [x] Make the actual chat itself a scrollable box
- [x] Make new user experience good this time. Add centered login / register screen if user not logged in.
- [x] Nav bar overlaps room title on mobile
- [x] Show the correct errors when passwords don't match or if username/email is duplicate
- [x] Update message box to already fill the screen
- [ ] See if it's possible to only get the scrollbar on the chat to go down when you specifically send a message
- [ ] Make the room cards not look like crap, maybe add room descriptions
- [ ] Add character limits where possible
- [ ] Make subscribe button to make user a basic member of the group. If nothing else, the room will show up on the sidebar for them.
- [ ] On sidebar, sort rooms by owned first, then subscribed. 
- [ ] Going to the room when it isn't created yet can show a page with a button that has you claim it. It will be a form with an invisible name entry.
- [ ] Make it so user isn't a hidden field when creating a message
- [ ] Message loading: First set of messages is loaded with a turbo frame button + latest 10 entries. Button when pressed can return a turbo stream which has next 10 messages and then itself.
- [ ] Two issues with profile pictures. First, actioncable is not showing the correct image link (uses example.com) when dynamically displaying images. Also, images load slow due to a lot of logic happening in the background.
