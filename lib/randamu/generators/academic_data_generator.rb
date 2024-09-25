module AcademicDataGenerator
  def education_level
    %w[Fundamental Medio Superior].sample
  end

  def course
    load_data('academic.courses').sample
  end

  def school_name
    load_data('academic.schools').sample
  end

  def university_name
    load_data('academic.universities').sample
  end

  def graduation_date(years_ago: 10)
    rand(Date.today - (365 * years_ago)..Date.today)
  end
end
