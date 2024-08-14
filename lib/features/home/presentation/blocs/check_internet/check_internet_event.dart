part of 'check_internet_bloc.dart';

sealed class CheckInternetEvent extends Equatable {
  const CheckInternetEvent();

  @override
  List<Object> get props => [];
}

class OfflineEvent extends CheckInternetEvent {}

class OnlineEvent extends CheckInternetEvent {}
