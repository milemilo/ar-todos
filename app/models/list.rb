class List < ActiveRecord::Base
  has_many :tasks

  def self.list(args = [1])
    list =[]
    todo = List.find(args.first)
    todo.tasks.each_with_index {|task, i| list << "[#{task.completed ? "X" : " "}] #{i+1}: #{task.name}"}
    "#{todo.name.capitalize} TODO List:\n\n" + list.join("\n")
  end

  def self.add(input)
    task_name = input.join(' ')
    List.find(1).tasks.create(name: task_name)
    "You've added a task! #{task_name}"
  end

  def self.complete(ids)
    task_id = List.find(1).tasks[ids.first.to_i-1].id
    Task.find(task_id).update_attributes(completed: !Task.find(task_id).completed)
    "You've just toggled task ##{ids.first} "
  end

  def self.delete(ids)
    task_id = List.find(1).tasks[ids.first.to_i-1].id
    return_string = "Deleted: #{Task.find(task_id).name}"
    Task.delete(task_id)
    return_string
  end
end
