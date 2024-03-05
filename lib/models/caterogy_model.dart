import 'package:store_app/helpers/app_images.dart';

class Category {
  final String id;
  final String image;
  final String text;

  Category({required this.id, required this.text, required this.image});
}

List<Category> categories = [
  Category(
    id: AppImages.imagesCategoriesBookImg,
    text: 'Book',
    image: AppImages.imagesCategoriesBookImg,
  ),
  Category(
    id: AppImages.imagesCategoriesFashion,
    text: 'Fation',
    image: AppImages.imagesCategoriesFashion,
  ),
  Category(
    id: AppImages.imagesCategoriesMobiles,
    text: 'Mobile',
    image: AppImages.imagesCategoriesMobiles,
  ),
  Category(
    id: AppImages.imagesCategoriesPc,
    text: 'Pc',
    image: AppImages.imagesCategoriesPc,
  ),
  Category(
    id: AppImages.imagesCategoriesShoes,
    text: 'Shoes',
    image: AppImages.imagesCategoriesShoes,
  ),
  Category(
    id: AppImages.imagesCategoriesWatch,
    text: 'Watch',
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
