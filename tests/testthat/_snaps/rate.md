# rates have print methods

    Code
      rate_delay(20, max_times = Inf)
    Message
      <rate: delay>
        Attempts: 0/Inf
        pause: 20
    Code
      rate_backoff()
    Message
      <rate: backoff>
        Attempts: 0/3
        pause_base: 1
        pause_cap: 60
        pause_min: 1

