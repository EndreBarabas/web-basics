# {{PROBLEM}} Web Design Recipe (Level Two)

## 1. Describe the Problem

As a user
So that I can find my cat that I lost
I want to post an advert for a lost cat with some description of the cat, and my telephone number so people can contact me

As a user
So that I can help others find their lost cats
I want to see all of the lost cat adverts


Stage two

As a user  
So that I can focus on the yet not-found cats  
I want to delete adverts for cats that have been found

As a user  
So that I can update lost cat adverts with potential sightings  
I want to update adverts

## 2. Design the Interface

_This is the fun part! Use excalidraw.com or a similar tool to design some
wireframes (rough sketches of the user interface). Include interactions and
transitions between pages — those are the most critical part._

![Diary design example](./lost_cat_design.png)

## 3. Design the Data Model Classes

_These classes should store and manage the data the server will hold._
_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class CatContainer
  def initialize
  end

  def list
    # Returns a list of instances of Cat
  end

  def add(cat) # entry is a Cat
    # No return value
  end

  def get(index) # index is a number
    # Returns a Cat, the Cat at the given index
  def

  def update(index, new_cat) # index is a number, new_cat
    # Updates the Cat at index to be the new_cat
    # No return value
  end

  def delete(index) # index is a number
    # Deletes Cat at index
  end
end

class Cat < Struct.new(:name, :number, :description)

end
```

_Check them against these rules:_

> 1. Does they represent a collection or collections of data?
> 2. Does each collection have relevant methods to:
>    1. List out all items in the resource
>    2. Create an item (C)
>    3. Get a single item (R)
>    4. Update an item (U)
>    5. Delete an item (D)
> 3. Is it possible to construct a realistic data model just by using simple
>    data types? (strings, integers, booleans)
> 
> This is OK:
> ```ruby
> diary = Diary.new
> entry = DiaryEntry.new("Title", "Contents")
> diary.add(entry)
> # Ultimately only two strings enter the data model.
> ```
> 
> This is not:
> ```ruby
> diary = Diary.new
> entry = DiaryEntry.new("Title", ["Comment One", "Comment Two"])
> diary.add(entry)
> # In this case, a string and a list of strings enter the data model.
> # A list isn't a simple enough data type.
> ```
> 
> The reason for this is that we will be moving onto databases. Databases
> typically can only store simple data types, so we're keeping that discipline
> for now!
> 
> Some of these rules will be relaxed later but will keep you safe for now.

## 4. Design the Web API (Requests)

_Design requests that perform each of the key operations on your data model._
_Map them to the methods or code snippets in your data model._

```ruby
# EXAMPLE

# INDEX
# Request: GET /cats
cat_container.list

# CREATE
# POST /cats
# With data: name=Bob&number=0754108494536&description=Missing bob the cat, please contact us asap
cat = Cat.new(name, number, description)
cat_container.add(cat)

# READ
# GET /cats/:index
cat_container.get(index)

# UPDATE
# PATCH /cats/:index
# With data: name=Bob&number=0754108494536&description=Missing bob the cat, please contact us asap
new_cat = Cat.new(name, number, description)
cat_container.update(index, new_cat)

# DELETE
# DELETE /cats/:index
cat_container.remove(index)
```

> Remember:
> GET: Getting a single item or a list of items
> POST: Adding an item
> PATCH: Updating an item
> DELETE: Deleting an item

## 5. Create Examples of User Interactions

_Create examples of user interactions and expectations._

```ruby
# As you learn the testing tools you might start writing with realistic test
# code here, but at the start it's OK if it's just English or made up code.

# View no entries
visit "/cats"
# User sees: No meow missing, happy day for everyone.

# Add an entry
visit "/cats"
click_link "Missing Meow"
fill_in "name", with:"Bob"
fill_in "number", with:"0754108181954"
fill_in "description", with:"Brown fur, spotty face, meows all the time."
click_button "Submit"
expect(page).to have_content "Bob"
# User sees the missing meow at the main page

# Multiple entries
visit "/diary"
click link "Add Entry"
enter "A beautiful day" into "Title" field
enter "I had a very nice day it's true." into "Contents" field
click button "Post"
click link "Add Entry"
enter "A bad day" into "Title" field
enter "I had a very bad day." into "Contents" field
click button "Post"
# User sees in the diary list:
# A bad day
# I had a very bad day.
# A beautiful day
# I had a very nice day it's true.

# Test going back from edit page

```

## 6. Test-Drive the Behaviour

_Follow this cycle:_

1. Add a feature test in `/spec/feature/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-starter-level-two&prefill_File=recipe/recipe.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
