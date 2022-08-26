# rates have print methods

    Code
      rate_delay(20, max_times = Inf)
    Output
      <rate: delay>
      Attempts: 0/Inf
      Fields:
       * `pause`: 20.00
    Code
      rate_backoff()
    Output
      <rate: backoff>
      Attempts: 0/3
      Fields:
       * `pause_base`: 1
       * `pause_cap`: 60
       * `pause_min`: 1

