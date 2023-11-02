import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/utils/app_urls.dart';

import 'api_client.dart';

class ApiService {
  final APIClient apiClient = APIClient();

  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrls.logIn, params: params);
  }

  Future<Response> socialLogin({var params}) {
    return apiClient.post(url: AppUrls.sociallogin, params: params);
  }

  Future<Response> logout({var params}) {
    return apiClient.post(url: AppUrls.logout, params: params);
  }

  Future<Response> registration({var params}) {
    return apiClient.post(url: AppUrls.register, params: params);
  }

  Future<Response> logInWithGoogle({var params}) {
    return apiClient.post(url: AppUrls.logIn, params: params);
  }

  Future<Response> sendOTP({var params}) {
    return apiClient.post(url: AppUrls.sendOTP, params: params);
  }

  Future<Response> varifyOTP({var params}) {
    return apiClient.post(url: AppUrls.varifyOTP, params: params);
  }

  Future<Response> resetPassword({var params}) {
    return apiClient.post(url: AppUrls.resetPassword, params: params);
  }

  Future<Response> changePassword({var params}) {
    return apiClient.post(url: AppUrls.changePassword, params: params);
  }

  Future<Response> careCardRegister({var params}) {
    return apiClient.post(url: AppUrls.careCardRegister, params: params);
  }

  Future<Response> onSuccess({var params}) {
    return apiClient.post(url: AppUrls.onSuccess, params: params);
  }

  Future<Response> orderPackage({var params}) {
    return apiClient.post(url: AppUrls.orderpackagr, params: params);
  }

  Future<Response> editProfile({var params}) {
    return apiClient.post(url: AppUrls.editprofile, params: params);
  }

  //
  // Future<Response> shopDetails({var params}) {
  //   return apiClient.post(AppUrls.createShopDetailsUrl, params);
  // }
  //
  // Future<Response> openingClosingTime({var params}) {
  //   return apiClient.post(AppUrls.openClosingTime, params);
  // }
  //
  // Future<Response> pricingList({var params}) {
  //   return apiClient.post(AppUrls.pricingListLanguage, params);
  // }
  //
  // Future<Response> postCampaign({var params}) {
  //   return apiClient.post(AppUrls.postCampaign, params);
  // }
  //
  // Future<Response> postAddStaff({var params}) {
  //   return apiClient.post(AppUrls.addStaff, params);
  // }
  // Future<Response> getCampaign() {
  //   return apiClient.get(url: AppUrls.getCampaign,);
  // }
  //
  //
  Future<Response> getIndividualplan() {
    return apiClient.get(url: AppUrls.getIndividualplan);
  }

  Future<Response> getCorporateplan() {
    return apiClient.get(url: AppUrls.getCorporateplan);
  }

  Future<Response> getallClinics() {
    return apiClient.get(url: AppUrls.allClinics);
  }

  Future<Response> getPlansbyID({required String planID}) {
    return apiClient.get(url: AppUrls.planbyid + planID);
  }

  Future<Response> getClinicsbyID({required String clinicID}) {
    return apiClient.get(url: AppUrls.clinicsbyid + clinicID);
  }

  Future<Response> getSchemes() {
    return apiClient.get(url: AppUrls.schemes);
  }

  Future<Response> getUserProfile() {
    return apiClient.get(url: AppUrls.userprofile);
  }

  Future<Response> getMyPlans() {
    return apiClient.get(url: AppUrls.myplans);
  }

  //
  // Future<Response> getReservation() {
  //   return apiClient.get(url: AppUrls.getReservation);
  // }
  //
  // Future<Response> getBarberStaff({required String userID}) {
  //   return apiClient.get(url: "${AppUrls.getBarberStaff}$userID", );
  // }
  //
  // Future<Response> deleteBarberStaff({required String userID}) {
  //   return apiClient.delete("${AppUrls.deleteBarberStaff}$userID", {});
  // }
  //
  // Future<Response> deleteReservation({required String userID}) {
  //   return apiClient.delete("${AppUrls.deleteBarberStaff}$userID", {});
  // }
  //
  // Future<Response> approvedReservation({required String userID}) {
  //   return apiClient.post("${AppUrls.postApprovedReservation}$userID", {});
  // }
  //
  // // Todo waleed
  // Future<Response> getContest() {
  //   return apiClient.get(url: AppUrls.contest,);
  // }
  // Future<Response> addParticipate({required var param}) {
  //   return apiClient.post(AppUrls.addParticipants,param);
  // }
  // Future<Response> getSpecificParticipant({required String userID}) {
  //   return apiClient.get(url: AppUrls.getSpecificParticipant+userID,);
  // }
  // Future<Response> deleteSpecificParticipant({required String userID}) {
  //   return apiClient.delete(AppUrls.deleteParticipation+userID,{});
  // }
  // Future<Response> getTrendingProduct({required String userID}) {
  //   return apiClient.get(url: AppUrls.trendingProduct+userID,);
  // }
  // Future<Response> getAProductDetail({var param}) {
  //   return apiClient.post(AppUrls.specificProducts,param);
  // }
  // Future<Response> addToCart({var param}) {
  //   return apiClient.post(AppUrls.addToCart,param);
  // }
  // Future<Response> getWishListByUserId({required String userID}) {
  //   return apiClient.get(url: AppUrls.getWishListByUserId+userID,);
  // }
  // Future<Response> addToWishlist({var param}) {
  //   return apiClient.post( AppUrls.addToWishlist,param);
  // }
  // Future<Response> getBarberProf({required String userID}) {
  //   return apiClient.get(url:  AppUrls.getBarberProf+userID);
  // }
  // Future<Response> getCartData({required String userID}) {
  //   return apiClient.get(url:  AppUrls.getCartData+userID);
  // }
  // Future<Response> updateBarberProfile({var param}) {
  //   return apiClient.put(url: AppUrls.updateBarberProfile+AppConstants.getUserID,params: param);
  // }
  //
  // Future<Response> changePassword({var param}) {
  //   return apiClient.put(url: AppUrls.changePassword+AppConstants.getUserID, params: param);
  // }
  //
  // Future<Response> deleteBarberAccount() {
  //   return apiClient.delete(AppUrls.deleteBarberAccount+AppConstants.getUserID,{});
  // }
  // Future<Response> removeToCart({required String cartID, required String productID}) {
  //   return apiClient.put(url: "${AppUrls.removeProductFromCart}$cartID/$productID",params: {});
  // }
  // Future<Response> createPayment({var param}) {
  //   return apiClient.post(AppUrls.createPayment,param);
  // }
  //
  // // TODO Jabbar
  // Future<Response> getMemberDetails({required String userID, required String barberId}) {
  //   return apiClient.get(url:  "${AppUrls.getMemberDetails}/$barberId/$userID");
  // }
  // Future<Response> scanMember({var params}) {
  //   return apiClient.post(AppUrls.scanMember, params);
  // }
  // Future<Response> setShopDetails({var params}) {
  //   return apiClient.post(AppUrls.setShopDetails, params);
  // }
  // Future<Response> getCampaignByPopularity() {
  //   return apiClient.get(url: AppUrls.getCampaignByPopularity, );
  // }
  // Future<Response> getStampsPerMonth() {
  //   return apiClient.get(url: AppUrls.getStampsPerMonth, );
  // }
}
