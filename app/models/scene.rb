# frozen_string_literal: true

#  < ApplicationRecord
class Scene
  def initialize(objective)
    @past_points = []
    @initial_point = "The projecty was initiated"
    @actual_point = "The projecty was initiated"
    @objective_point = objective
  end

  attr_accessor :past_points, :initial_point, :actual_point, :objective_point

  def to_json(*_args)
    {
      past_points: past_points,
      initial_point: initial_point,
      actual_point: actual_point,
      objective_point: objective_point
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    scene = Scene.new
    scene.past_points = data["past_points"]
    scene.initial_point = data["initial_point"]
    scene.actual_point = data["actual_point"]
    scene.objective_point = data["objective_point"]
    scene
  end
end
