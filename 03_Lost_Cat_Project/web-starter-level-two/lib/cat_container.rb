class CatContainer
  def initialize
    @cats = []
  end

  def list
    cats
  end

  def get_cat(index)
    return cats[index]
  end

  def add(cat_instance)
    @cats << cat_instance
  end

  def remove(index)
    @cats.delete_at(index)
  end

  # Smarter way to merge these functions? (dont repeat yourself)
  def update_name(name, new_name)
    @cats.each do |cat|
      cat.name = new_name if name == cat.name
    end
  end

  def update_number(number, new_number)
    @cats.each do |cat|
      cat.number = new_number if number == cat.number
    end
  end

  def update_description(desc, new_desc)
    @cats.each do |cat|
      cat.description = new_desc if desc == cat.description
    end
  end

  private

  attr_reader :cats
end
