import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? 'ko';

  String getVariableText({
    String? koText = '',
    String? enText = '',
  }) =>
      [koText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'mcp7x0c3': {
      'ko': '대한민국',
      'en': '',
    },
    '8k95x4na': {
      'ko': ' 100만 사용자',
      'en': '',
    },
    'dktg12vo': {
      'ko': '가 선택한\n글로벌 투자 자문 플랫폼',
      'en': '',
    },
    'uj4sfbfy': {
      'ko': '시작하기',
      'en': '',
    },
    'd39s9mcx': {
      'ko': 'Home',
      'en': '',
    },
  },
  // MainCase1stPage
  {
    'frgtealk': {
      'ko': 'AIMer님 환영합니다,\n자산을 늘리는 첫 걸음을 함께 나아가요',
      'en': '',
    },
    '6w9detjb': {
      'ko': '홈',
      'en': '',
    },
    'clcqhrhq': {
      'ko': '자산',
      'en': '',
    },
    '1xhhjkjr': {
      'ko': '활동',
      'en': '',
    },
    'xnjgw0vh': {
      'ko': '더보기',
      'en': '',
    },
    'w7hen0w7': {
      'ko': 'Home',
      'en': '',
    },
  },
  // MillionDollarCreateAccountPage
  {
    'yfhn8euq': {
      'ko': '어떤 계좌에 달러를 충전할까요?',
      'en': '',
    },
    '2vyosaei': {
      'ko': '은행 선택',
      'en': '',
    },
    'ges8eof8': {
      'ko': '은행을 선택해주세요.',
      'en': '',
    },
    'ec6i1iqg': {
      'ko': '계좌번호 입력',
      'en': '',
    },
    '8237uhdu': {
      'ko': '계좌번호를 입력해주세요.',
      'en': '',
    },
    'rq3u4ghq': {
      'ko': '예금주 이름 입력',
      'en': '',
    },
    '4zmd7se9': {
      'ko': '예금주 이름 입력',
      'en': '',
    },
    '6lv0h328': {
      'ko': '안내 사항',
      'en': '',
    },
    '3dyu7zzm': {
      'ko': '환전송금은 월~금요일(공휴일 제외) 오전 10시부터 오후 3시까지 가능합니다.',
      'en': '',
    },
    '2bz4k0em': {
      'ko': '예금주 조회 및 등록',
      'en': '',
    },
    '5qw595bb': {
      'ko': 'Home',
      'en': '',
    },
  },
  // MillionDollarInspectPage
  {
    'xii8kbs7': {
      'ko': '점검중입니다.',
      'en': '',
    },
    'jsdbnc64': {
      'ko': '파트너사 시스템 점검시간입니다. \n시스템 복구되면 별도로 알림을 드리겠습니다.',
      'en': '',
    },
    'fk3llhio': {
      'ko': 'Home',
      'en': '',
    },
  },
  // MainPage
  {
    'zf1tcixp': {
      'ko': 'AIMer 님 환영합니다!\n프리미엄 자산관리를 시작해보세요',
      'en': '',
    },
    'y2wj5ue7': {
      'ko': '나에게 맞는 프로그램으로 자산관리를 시작 할 수 있어요.',
      'en': '',
    },
    'en6ra32e': {
      'ko': 'AIM Essential',
      'en': '',
    },
    'tkc51d2z': {
      'ko': '연 1.0%',
      'en': '',
    },
    'goxyp55d': {
      'ko': '상위 1% 글로벌 투자자 노하우를 담은 AIM의 Signature 전략',
      'en': '',
    },
    '1f2169to': {
      'ko': '77개국 12,700여개 글로벌 우량 자산',
      'en': '',
    },
    '1bra3koy': {
      'ko': '개인 맞춤형 포트폴리오 제공',
      'en': '',
    },
    '4mkb13tt': {
      'ko': '장기 분산 투자 전략을 통한 안전한 수익 제공',
      'en': '',
    },
    'u2d6k9qk': {
      'ko': '본인 명의 증권계좌로 안정적인 자금관리',
      'en': '',
    },
    'cvo2xjpe': {
      'ko': '연간 3.5%의 배당금 기대하며, 적금 이자 보다 높은 수익 제공',
      'en': '',
    },
    '4pxnn10b': {
      'ko': 'AIM Essential 시작하기',
      'en': '',
    },
    '7gle29mx': {
      'ko': '관리금액 이체하기',
      'en': '',
    },
    'to8umv67': {
      'ko': '자금 이체를 위한 입금 전용 계좌정보입니다',
      'en': '',
    },
    'sdxhrftw': {
      'ko': '이체 계좌 은행명',
      'en': '',
    },
    'kqcbh4gh': {
      'ko': '기업은행',
      'en': '',
    },
    'jntbg5h5': {
      'ko': '계좌번호',
      'en': '',
    },
    'uq4uhzpw': {
      'ko': '4312949832481',
      'en': '',
    },
    'f53amuzc': {
      'ko': '계좌번호 복사',
      'en': '',
    },
    't5kpupfm': {
      'ko': '예금주',
      'en': '',
    },
    'y5328lrk': {
      'ko': 'AIM_당나귀',
      'en': '',
    },
    '이체 결과 확인 하기': {
      'ko': '이체 결과 확인 하기',
      'en': '',
    },
    'm7kucprf': {
      'ko': 'AIM TAOS',
      'en': '',
    },
    '7wp9t087': {
      'ko': '연 1.2%',
      'en': '',
    },
    'xhl4dhnp': {
      'ko': '투자와 절세를 한번에 하는 혁신적인 1:1 맞춤 절세 솔루션',
      'en': '',
    },
    'au0vc8v2': {
      'ko': 'Tax Aware Optimmization Strategy',
      'en': '',
    },
    '5dw924yb': {
      'ko': '업계 최초 1:1 맞춤 절세 솔루션',
      'en': '',
    },
    'jz34y6bl': {
      'ko': '세후 수익 극대화를 목표로, 포트폴리오 리밸런싱과 위험 요인 차단을 동시에 실현',
      'en': '',
    },
    'sqss3j4n': {
      'ko': '세후 수익 극대화를 목표로, 포트폴리오 \n리밸런싱과 위험 요인 차단을 동시에 실현',
      'en': '',
    },
    '43va1e0d': {
      'ko': '연간 3.5%의 배당금 기대하며, 적금 이자 보다 높은 수익 제공',
      'en': '',
    },
    '3irjtszx': {
      'ko': 'AIM TAOS 시작하기',
      'en': '',
    },
    'o671pwkx': {
      'ko': '관리금액 이체하기',
      'en': '',
    },
    'kigo93aj': {
      'ko': '자금 이체를 위한 입금 전용 계좌정보입니다',
      'en': '',
    },
    'zyfl2oeu': {
      'ko': '이체 계좌 은행명',
      'en': '',
    },
    'rqsw9iyr': {
      'ko': '기업은행',
      'en': '',
    },
    'u0ow8wwz': {
      'ko': '계좌번호',
      'en': '',
    },
    'o1s5omwn': {
      'ko': '4312949832481',
      'en': '',
    },
    '0j6suaso': {
      'ko': '계좌번호 복사',
      'en': '',
    },
    '0t8vg4rz': {
      'ko': '예금주',
      'en': '',
    },
    'c97fmji1': {
      'ko': 'AIM_당나귀',
      'en': '',
    },
    '이체 결과 확인 하기': {
      'ko': '이체 결과 확인 하기',
      'en': '',
    },
    'ldjffijy': {
      'ko': 'Home',
      'en': '',
    },
  },
  // BottomSheetSelectBanking
  {
    '2hc7y66c': {
      'ko': '은행 선택',
      'en': '',
    },
    'dabd60b3': {
      'ko': '국민은행',
      'en': '',
    },
    '0lb1fmz7': {
      'ko': '국민은행',
      'en': '',
    },
    'a2ofexsa': {
      'ko': '국민은행',
      'en': '',
    },
    's2jbv1xb': {
      'ko': '국민은행',
      'en': '',
    },
    'klii6q7j': {
      'ko': '국민은행',
      'en': '',
    },
    'iaxkwhgg': {
      'ko': '국민은행',
      'en': '',
    },
    'b861dgdx': {
      'ko': '국민은행',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'o0rlsnae': {
      'ko': '',
      'en': '',
    },
    '3xsa8aea': {
      'ko': '',
      'en': '',
    },
    'o5njw752': {
      'ko': '',
      'en': '',
    },
    '83a5l3d5': {
      'ko': '',
      'en': '',
    },
    'wocyl76r': {
      'ko': '',
      'en': '',
    },
    '6oh0pj6w': {
      'ko': '',
      'en': '',
    },
    'ltwqy9xv': {
      'ko': '',
      'en': '',
    },
    'ewjwv9qw': {
      'ko': '',
      'en': '',
    },
    '128wnjic': {
      'ko': '',
      'en': '',
    },
    'qfyzayvf': {
      'ko': '',
      'en': '',
    },
    'kneckzdt': {
      'ko': '',
      'en': '',
    },
    'nhzhyx58': {
      'ko': '',
      'en': '',
    },
    '78n4g0ut': {
      'ko': '',
      'en': '',
    },
    'lovw8331': {
      'ko': '',
      'en': '',
    },
    '6vg6mrdx': {
      'ko': '',
      'en': '',
    },
    'mjzxbxji': {
      'ko': '',
      'en': '',
    },
    'x29kk6o2': {
      'ko': '',
      'en': '',
    },
    'h68f7wt0': {
      'ko': '',
      'en': '',
    },
    'iwsijz9b': {
      'ko': '',
      'en': '',
    },
    'v3bx0oea': {
      'ko': '',
      'en': '',
    },
    'ntbhn7v8': {
      'ko': '',
      'en': '',
    },
    'y8yr2oto': {
      'ko': '',
      'en': '',
    },
    '3kf7do9e': {
      'ko': '',
      'en': '',
    },
    'sshydj7c': {
      'ko': '',
      'en': '',
    },
    'djeqbkj9': {
      'ko': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
