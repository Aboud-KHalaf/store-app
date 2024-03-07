import 'package:store_app/helpers/app_images.dart';

class Category {
  final String id;
  final String image;
  final String text;

  Category({required this.id, required this.text, required this.image});
}

List<Category> categories = [
  Category(
    id: AppImages.imagesCategoriesMobiles,
    text: 'Phones',
    image: AppImages.imagesCategoriesMobiles,
  ),
  Category(
    id: AppImages.imagesCategoriesBookImg,
    text: 'Books',
    image: AppImages.imagesCategoriesBookImg,
  ),
  Category(
    id: AppImages.imagesCategoriesPc,
    text: 'Laptops',
    image: AppImages.imagesCategoriesPc,
  ),
  Category(
    id: AppImages.imagesCategoriesFashion,
    text: 'Clothes',
    image: AppImages.imagesCategoriesFashion,
  ),
  Category(
    id: AppImages.imagesCategoriesShoes,
    text: 'Shoes',
    image: AppImages.imagesCategoriesShoes,
  ),
  Category(
    id: AppImages.imagesCategoriesWatch,
    text: 'Watches',
    image: AppImages.imagesCategoriesWatch,
  ),
  Category(
    id: AppImages.imagesCategoriesCosmetics,
    text: 'Cosmetics',
    image: AppImages.imagesCategoriesCosmetics,
  ),
  Category(
    id: AppImages.imagesCategoriesElectronics,
    text: 'Electronics',
    image: AppImages.imagesCategoriesElectronics,
  ),
];
