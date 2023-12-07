part of 'get_qr_bloc.dart';

abstract class GetQrState extends Equatable {
  const GetQrState();
}

class GetQrInitial extends GetQrState {
  @override
  List<Object> get props => [];
}

class GetQrImageLoaded extends GetQrState {

  final String imageInBase64;

  const GetQrImageLoaded({required this.imageInBase64});
  @override
  List<Object> get props => [];
}
