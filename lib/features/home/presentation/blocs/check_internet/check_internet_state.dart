part of 'check_internet_bloc.dart';

class CheckInternetState extends Equatable {
  const CheckInternetState();
  @override
  List<Object> get props => [];
}

class OnlineState extends CheckInternetState {}

class OfflineState extends CheckInternetState {}
