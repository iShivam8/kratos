// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:paycrunch/data/college_model.dart';

// @immutable
// class CollegeEmailState {
//   final bool isLoading;
//   final int currentPage;
//   final CollegeModel? selectedCollege;
//   final CollegeModel? selectedPendingCollege;
//   final String selectedDomain;
//   final String collegeUsername;
//   final String collegeEmail;
//   final GlobalKey<FormState> emailFormkey;
//   final PageController pageController;

//   const CollegeEmailState({
//     this.isLoading = false,
//     this.currentPage = 0,
//     this.selectedCollege,
//     this.selectedPendingCollege,
//     this.selectedDomain = '',
//     this.collegeUsername = '',
//     this.collegeEmail = '',
//     required this.emailFormkey,
//     required this.pageController,
//   });

//   CollegeEmailState copyWith({
//     bool? isLoading,
//     int? currentPage,
//     String? selectedDomain,
//     String? collegeUsername,
//     String? collegeEmail,
//     CollegeModel? selectedCollege,
//     CollegeModel? selectedPendingCollege,
//   }) {
//     return CollegeEmailState(
//       isLoading: isLoading ?? this.isLoading,
//       currentPage: currentPage ?? this.currentPage,
//       selectedDomain: selectedDomain ?? this.selectedDomain,
//       selectedCollege: selectedCollege ?? this.selectedCollege,
//       selectedPendingCollege:
//           selectedPendingCollege ?? this.selectedPendingCollege,
//       collegeUsername: collegeUsername ?? this.collegeUsername,
//       collegeEmail: collegeEmail ?? this.collegeEmail,
//       emailFormkey: emailFormkey,
//       pageController: pageController,
//     );
//   }
// }

// class CollegeEmailStateNotifier extends StateNotifier<CollegeEmailState> {
//   CollegeEmailStateNotifier()
//       : super(CollegeEmailState(
//           emailFormkey: GlobalKey<FormState>(),
//           pageController: PageController(),
//         ));

//   void setLoading(bool value) {
//     state = state.copyWith(isLoading: value);
//   }

//   void setCurrentPage(int page) {
//     state = state.copyWith(currentPage: page);
//   }

//   void setSelectedDomain(String domain) {
//     state = state.copyWith(selectedDomain: domain);
//   }

//   void setCollegeUsername(String username) {
//     state = state.copyWith(collegeUsername: username);
//   }

//   void setCollegeEmail(String email) {
//     state = state.copyWith(collegeEmail: email);
//   }

//   void setCollege(CollegeModel? collegeModel) {
//     state = state.copyWith(selectedCollege: collegeModel);
//   }

//   void setPendingCollege(CollegeModel? collegeModel) {
//     state = state.copyWith(selectedPendingCollege: collegeModel);
//   }
// }

// final collegeEmailStateNotifierProvider =
//     StateNotifierProvider<CollegeEmailStateNotifier, CollegeEmailState>(
//   (ref) => CollegeEmailStateNotifier(),
// );

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class TabIndexState {
  final int currentPageIndex;

  const TabIndexState({this.currentPageIndex = 0});

  TabIndexState copyWith({int? currentPageIndex}) {
    return TabIndexState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex);
  }
}

class TabIndexStateNotifier extends StateNotifier<TabIndexState> {
  TabIndexStateNotifier() : super(const TabIndexState());

  void setCurrentPageIndex(int index) {
    state = state.copyWith(currentPageIndex: index);
  }
}

final tabIndexStateNotifierProvider =
    StateNotifierProvider<TabIndexStateNotifier, TabIndexState>(
  (ref) => TabIndexStateNotifier(),
);
