//
//  HomeInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

protocol HomeInjection {
    func resolve() -> HomeViewController
    
    func resolve() -> HomeViewModel
    
    func resolve() -> HomeRouteCase
    func resolve() -> HomeTabBarController
    
    func resolve() -> MealsDataSourceProtocol
    func resolve() -> MealsFavoriteDataSourceProtocol
    func resolve() -> MealsRepository
    func resolve() -> HomeUseCase
}

extension HomeInjection where Self: Injection {
    
    func resolve() -> HomeViewController {
        return HomeViewController(homeViewModel: resolve(), router: resolve())
    }
    
    func resolve() -> HomeRouteCase {
        return HomeRouter(injection: self)
    }
    
    func resolve() -> HomeTabBarController {
        return HomeTabBarController(router: resolve())
    }
    
    func resolve() -> HomeViewModel {
        return HomeViewModel(homeInteractor: resolve())
    }
    
    func resolve() -> MealsDataSourceProtocol {
        return MealsDataSource()
    }
    
    func resolve() -> MealsFavoriteDataSourceProtocol {
        return MealsFavoriteDataSource()
    }
    
    func resolve() -> MealsRepository {
        return DefaultMealsRepository(mealsDataSource: resolve(), mealFavo: resolve())
    }
    
    func resolve() -> HomeUseCase {
        return HomeInteractor(mealsRepo: resolve())
    }
}
