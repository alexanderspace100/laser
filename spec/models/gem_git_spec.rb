
RSpec.describe GemGit, type: :model do
  it "has working factory" do
    gem_git = build :gem_git
    expect(gem_git.save).to be true
  end

  it "checks name attribute" do
    gem_git = build :gem_git, name: ""
    expect(gem_git.save).to be false
  end

  it "checks last_commit attribute" do
    gem_git = build :gem_git, last_commit: nil
    expect(gem_git.save).to be false
  end

  it "checks forks_count attribute" do
    gem_git = build :gem_git, forks_count: nil
    expect(gem_git.save).to be false
  end

  it "checks stargazers_count attribute" do
    gem_git = build :gem_git, stargazers_count: nil
    expect(gem_git.save).to be false
  end

  it "checks watchers_count attribute" do
    gem_git = build :gem_git, watchers_count: nil
    expect(gem_git.save).to be false
  end

  it "checks open_issues_count attribute" do
    gem_git = build :gem_git, open_issues_count: nil
    expect(gem_git.save).to be false
  end

  it "checks gem_git has only one laser_gem" do
    gem_git = build :gem_git_with_laser_gem
    expect(gem_git.laser_gem).not_to be nil
  end

  it "can store an array of commit_dates" do
    gem_git = build :gem_git
    gem_git.commit_dates_year = [1, 2, 3]
    gem_git.save!
    expect(gem_git.commit_dates_year).to eq [1, 2, 3]
  end
end
