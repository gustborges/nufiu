Analytics = Segment::Analytics.new({
                                     write_key: '9G0H0qUp7vT5jNbFHwW68cj8DyMvylku',
                                     on_error: proc { |_status, msg| print msg }
                                   })
