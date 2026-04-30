use std::fmt;
pub struct Clock {
    hours: i32,
    minutes: i32,
}

fn calculate_minutes(minutes: i32) -> (i32, i32) {
    let mut sixty_times = 0;
    let mut new_minutes = minutes;
    if minutes < 0 {
        while new_minutes < 0 {
            new_minutes += 60;
            sixty_times += 1;
        }
    } else {
        sixty_times = minutes / 60;
        new_minutes = minutes - (sixty_times * 60);
    }
    (sixty_times, new_minutes)
}

fn calculate_hours(hours: i32) -> i32 {
    let twentyfour_times = hours / 24;
    let mut new_hours = hours;
    if hours < 0 {
        while new_hours < 0 {
            new_hours += 24;
        }
    } else {
        new_hours = hours - (twentyfour_times * 24);
    }
    new_hours
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let raw_clock = Clock {
            hours,
            minutes,
        };
        raw_clock.normalize()
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let sum_minutes = self.minutes + minutes;
        let mut new_hours: i32 = self.hours;
        let mut new_minutes: i32 = sum_minutes;
        if minutes > 0 && sum_minutes >= 60 {
            (new_hours, new_minutes) = calculate_minutes(sum_minutes);
            new_hours = new_hours + self.hours;
            if new_hours >= 24 {
                new_hours = calculate_hours(new_hours);
            }
        } else {
            if sum_minutes < 0 {
                let extra_hours: i32;
                (extra_hours, new_minutes) = calculate_minutes(minutes);
                new_minutes = self.minutes + new_minutes;
                new_hours = calculate_hours(self.hours - extra_hours);
            }
        }

        Clock { 
            hours: new_hours, 
            minutes: new_minutes,
        }
    }

    pub fn normalize(&self) -> Self {
        let (extra_hours, minutes) = calculate_minutes(self.minutes);
        let hours: i32;
        if self.hours < 0 || self.minutes < 0 {
            hours = calculate_hours(self.hours - extra_hours); // should give it from 0 to 23
        } else {
            hours = calculate_hours(self.hours + extra_hours);
        }
        Clock { 
            hours, 
            minutes,
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:0>2}:{:0>2}", self.hours, self.minutes)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        let self_normalized: Clock = self.normalize();
        let other_normalized: Clock = other.normalize();
        self_normalized.hours == other_normalized.hours && self_normalized.minutes == other_normalized.minutes
    }
    
    fn ne(&self, other: &Self) -> bool {
        !self.eq(other)
    }
}

impl fmt::Debug for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("Clock")
         .field("hours", &self.hours)
         .field("minutes", &self.minutes)
         .finish()
    }
}

