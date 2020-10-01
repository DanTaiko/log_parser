# frozen_string_literal: true

APP_ROOT = './lib_v1/'

require "#{APP_ROOT}models/line"
require "#{APP_ROOT}collection/collector"
require "#{APP_ROOT}collection/sorter"
require "#{APP_ROOT}file_validator/file_validator"
require "#{APP_ROOT}parser/file_parser"
require "#{APP_ROOT}parser/line_parser"
require "#{APP_ROOT}presenter/presenter"
