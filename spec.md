# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has many Events)
- [x] Include at least one belongs_to relationship (Event belongs to User)
- [x] Include at least one has_many through relationship (User has many categories through events)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (events.name, location, date, &c.)
- [x] Include reasonable validations for simple model objects (User: unique username, password, password and confirmation must match / Category: must have a name / Event: must have name, location, category)
- [x] Include a class level ActiveRecord scope method (Event.upcoming_events, /chronological)
- [x] Include signup (I created a form)
- [x] Include login (I created a form)
- [x] Include logout (I created a form)
- [x] Include third party signup/login (OmniAuth with Facebook)
- [x] Include nested resource show or index (users/1/events)
- [x] Include nested resource "new" form (URL e.g. categories/1/events/new)
- [x] Include form display of validation errors (events/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
