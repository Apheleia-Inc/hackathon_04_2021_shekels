Future<void> initPrecacheImages() async {
  await Future.wait([
    _initSvgAsset('assets/images/logo/logo_with_text.svg'),
    _initSvgAsset('assets/images/miscs/under_construction.svg'),
  ]);
}

Future<void> _initSvgAsset(String assetName) async {
  // await precachePicture(
  //   ExactAssetPicture(
  //     SvgPicture.svgStringDecoder,
  //     assetName,
  //   ),
  //   null,
  // );
}
