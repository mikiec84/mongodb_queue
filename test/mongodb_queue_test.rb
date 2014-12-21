require 'test/unit'
require 'mongodb_queue'

class MongoDBQueueTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @config = {
        address: 'localhost',
        port: 27017,
        database: 'test-db',
        collection: 'test-collection',
        username: 'test-user',
        password: 'test-pass'
    }
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end
  
  def test_initialize_no_address
    @config.delete :address
    exception = assert_raise(RuntimeError) {MongoDBQueue::MongoDBQueue.new(@config)}
    assert_equal('No database address set', exception.message)
  end

  def test_initialize_no_port
    @config.delete :port
    exception = assert_raise(RuntimeError) {MongoDBQueue::MongoDBQueue.new(@config)}
    assert_equal('No database port set', exception.message)
  end

  def test_initialize_no_db
    @config.delete :database
    exception = assert_raise(RuntimeError) {MongoDBQueue::MongoDBQueue.new(@config)}
    assert_equal('No database set', exception.message)
  end

  def test_initialize_no_collection
    @config.delete :collection
    exception = assert_raise(RuntimeError) {MongoDBQueue::MongoDBQueue.new(@config)}
    assert_equal('No collection set', exception.message)
  end
  
  
end