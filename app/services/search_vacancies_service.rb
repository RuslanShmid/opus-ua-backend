class SearchVacanciesService

  def initialize(title: nil, category: nil, city: nil)
    @title = title
    @category = category
    @city = city
  end

  def perform
    vacancies
  end

  private

  def vacancies
    vacancies = Vacancy.order(:id).reverse_order
    vacancies = vacancies.where("lower(title) LIKE ?", "%#{@title.downcase}%") if @title
    vacancies = vacancies.where("lower(category) LIKE ?", "%#{@category.downcase}%") if @category
    vacancies = vacancies.where("lower(city) LIKE ?", "%#{@city.downcase}%") if @city
    vacancies
  end
end
