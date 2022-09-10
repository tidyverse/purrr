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

# rate_delay() delays

    Code
      rate_sleep(rate)
    Condition
      Error in `stop_rate_excess()`:
      ! Request failed after 3 attempts

---

    Code
      rate_sleep(rate)
    Condition
      Error in `stop_rate_expired()`:
      ! This `rate` object has already be run more than `max_times` allows.
      Do you need to reset it with `rate_reset()`?

# rate_backoff() backs off

    Code
      rate_sleep(rate)
    Condition
      Error in `stop_rate_excess()`:
      ! Request failed after 3 attempts

---

    Code
      rate_sleep(rate)
    Condition
      Error in `stop_rate_expired()`:
      ! This `rate` object has already be run more than `max_times` allows.
      Do you need to reset it with `rate_reset()`?

# rate_sleep() checks that rate is still valid

    Code
      rate_sleep(rate)
    Condition
      Error in `stop_rate_excess()`:
      ! Request failed after 0 attempts

---

    Code
      rate_sleep(rate)
    Condition
      Error in `stop_rate_expired()`:
      ! This `rate` object has already be run more than `max_times` allows.
      Do you need to reset it with `rate_reset()`?

