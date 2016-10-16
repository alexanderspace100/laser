class LaserGem < ApplicationRecord
  validates :name, length: { in: 2..30}, format: { without: /\s/, message: "must contain no spaces" }
  has_many :gem_dependencies
  has_many :dependencies, :through => :gem_dependencies

  has_many :gem_dependents, class_name: "GemDependency", foreign_key: :dependency_id
  has_many :dependents, :through => :gem_dependents, source: :laser_gem

  has_many :comments

  has_one :gem_spec
  has_one :gem_git

  has_many :owners
  #
  # Add a gem as a dependency of this one.
  #
  def register_dependency(dep, version)
    GemDependency.create!(
      laser_gem: self,
      dependency: dep,
      version: version,
    )
    self.reload
  end

  #
  # Remove a dependency
  #
  def remove_dependency(dep)
    GemDependency.where(
      laser_gem: self,
      dependency: dep,
    ).destroy_all
    self.reload
  end
end
