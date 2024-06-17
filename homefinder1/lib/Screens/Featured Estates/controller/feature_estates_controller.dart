import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/get_all_reesidences_model.dart';
import '../../../models/get_one_residence_model.dart' as o;
import '../../../services/residences_services.dart';
import '../../single detail/single_detail.dart';


class FeatureEstatesController extends GetxController {
  final BuildContext? context;
  FeatureEstatesController(this.context);

  ScrollController scroll = ScrollController();
  bool isLoading = true;
  int currentPage = 1;
  int maxPages = 1;
  bool isLoadingMore = false;
  List<Residence>? residences = [];
  o.Residence? residence;
  int? residenceCount;
  late TextEditingController searchController;

  final List<Map<String, String>> gridView = [
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Frame 34221.png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Rectangle 9.png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Frame 34221 (1).png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Rectangle 9 (1).png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Rectangle 9 (2).png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Frame 34221 (1).png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Rectangle 9 (3).png"
    },
    {
      "title": "Lorem House",
      "price": "\$1500/month",
      "location": "Avenue west Side",
      "image": "lib/assets/images/Rectangle 9 (3).png"
    },
  ];

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    getDataOfResidences();
    scroll.addListener(_onScroll);
  }

  @override
  void onClose() {
    scroll.removeListener(_onScroll);
    scroll.dispose();
    searchController.dispose();
    super.onClose();
  }

  void _onScroll() {
    if (scroll.position.pixels == scroll.position.maxScrollExtent && currentPage < maxPages) {
      loadMoreDataOfResidences();
    }
  }

  Future<void> getDataOfResidences() async {
    try {
      if (currentPage == 1) {
        isLoading = true;
      } else {
        isLoadingMore = true;
      }
      update();

      GetAllResidencesModel? response = await ResidenceServices.fetchAllResidences(currentPage, context!);
      if (response != null) {
        if (currentPage == 1) {
          residences = response.residences ?? [];
          residenceCount = response.count ?? 0;
        } else {
          residences?.addAll(response.residences ?? []);
        }
        maxPages = 100; // Assuming `totalPages` field is available in response
      } else {
        print("Some error occurred: Response is null");
      }

      isLoading = false;
      isLoadingMore = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
      isLoadingMore = false;
      update();
    }
  }

  Future<void> getDataOfOneResidence(String resId) async {
    try {
      isLoading = true;
      update();

      o.GetOneResidencesModel? response = await ResidenceServices.fetchOneResidences(resId, context!);
      if (response != null) {
        residence = response.residence;
        Get.to(() => SingleDetailScreen(resId));
        print("Residence details: ${residence}");
      } else {
        print("Some error occurred: Response is null");
      }

      isLoading = false;
      update();
    } catch (e) {
      print("Exception occurred: $e");
      isLoading = false;
      update();
    }
  }

  void loadMoreDataOfResidences() {
    if (!isLoadingMore && currentPage < maxPages) {
      currentPage += 1;
      getDataOfResidences();
    }
  }
}
