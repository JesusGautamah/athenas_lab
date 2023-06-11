# frozen_string_literal: true

# < ApplicationRecord
class Conductor
  def initialize(_board_project_id)
    @project_title = board_project.title
    @instructions = board_project.descriptions
    @cast = []
    @memory = []
  end

  attr_accessor :project_title, :instructions, :memory, :cast

  def add_to_cast(actor)
    @cast << actor
  end

  def add_memory(memory)
    @memory << memory
  end

  def find_actor(actor_name)
    @cast.find { |actor| actor[:actor_name] == actor_name }
  end

  def system_config
    @system_config = {
      role: "system",
      content: "Your name is Athenas AI and you have the following actors: #{cast.pluck(:actor_name).join(", ")}.
              You can ask them to do something by saying: #{cast.pluck(:actor_name).join(", ")} do {what u want to know or help with}
              Your project is #{project_title} and your instructions are: #{instruction}
              Your objective is conduct the project to #{scene[:objective_point]}
              So you need to create a step by step strategy to generate instructions to the user using the actors, every time you receive a message with an actor name or function,
              generate a the question to the actor, this is programmed to receive your question automatic, and send to the actor, and the actor will respond with a message,
              so you send the objective with this actor response to the next actor, and so on, until you reach the objective, and you can ask the actors to do something else.
              "
    }
  end
  a
  def to_json(*_args)
    {
      project_title: project_title,
      instructions: instructions,
      memory: memory,
      system_config: system_config
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    conductor = Conductor.new
    conductor.project_title = data["project_title"]
    conductor.instructions = data["instructions"]
    conductor.memory = data["memory"]
    conductor.system_config = data["system_config"]
    conductor
  end
end
