class Settings < Settingslogic

  ROOT_DIR = File.join(File.dirname(__FILE__), '..')
  LIB_DIR = File.join(ROOT_DIR, 'lib')
  CONFIG_DIR = File.join(ROOT_DIR, 'config')
  TEST_DIR = File.join(ROOT_DIR, 'tests')


  source File.join(CONFIG_DIR, 'config.yml')
end