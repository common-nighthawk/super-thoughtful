module SessionsHelper
  MIN_AGE = 18
  MAX_AGE = 100

  def start_year
    (Date.today - MIN_AGE.years).year
  end

  def end_year
    (Date.today - MAX_AGE.years).year
  end
end
