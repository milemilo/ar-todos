class List < ActiveRecord::Base
  has_many :tasks

  def create(task_name)
  end

  def self.list(*args)
    list =[]
    List.all.each {|task| list << "Task##{task.id}: #{task.name}"}
    list.join("\n")
  end

  def update(id, task_name)
  end

  def complete(id)
  end

  def delete(id)
  end
end
