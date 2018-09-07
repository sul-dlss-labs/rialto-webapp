# frozen_string_literal: true

# Represents a university, school, divisition or department
class Organization < ApplicationRecord
  DEPARTMENT = 'http://vivoweb.org/ontology/core#Department'
  store_accessor :metadata, :name, :type, :country
  scope :departments, -> { where("metadata->>'type' = ?", DEPARTMENT).order("metadata->>'name'") }
end
