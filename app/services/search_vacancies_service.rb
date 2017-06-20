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
    vacancies = vacancies.where("title LIKE ?", "%#{@title}%") if @title
    vacancies = vacancies.where("category LIKE ?", "%#{@category}%") if @category
    vacancies = vacancies.where("city LIKE ?", "%#{@city}%") if @city
    vacancies
  end
end
