class CatContainer
  def initialize
    @cats = []
  end

  def list
    cats
  end

  def add(cat_instance)
    @cats << cat_instance
  end

  def remove(cat_instance)
    @cats.delete(cat_instance) if @cats.include?(cat_instance)
  end

  private

  attr_reader :cats
end
