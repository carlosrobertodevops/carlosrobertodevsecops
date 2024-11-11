import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt', 'es'];

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
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
    String? esText = '',
  }) =>
      [enText, ptText, esText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'gygh22st': {
      'en': 'example.info@example.com',
      'es': 'ejemplo.info@ejemplo.com',
      'pt': 'exemplo.info@exemplo.com',
    },
    '5tvoxhfh': {
      'en': 'Copy',
      'es': 'Copiar',
      'pt': 'Cópia',
    },
    'udypen6e': {
      'en': 'cv',
      'es': 'currículum vitae',
      'pt': 'cv',
    },
    'j2rxglfc': {
      'en': 'LinkedIn',
      'es': 'LinkedIn',
      'pt': 'LinkedIn',
    },
    'dz9sicbz': {
      'en': 'X',
      'es': 'incógnita',
      'pt': 'X',
    },
    '8i0n580c': {
      'en': 'example.info@example.com',
      'es': 'ejemplo.info@ejemplo.com',
      'pt': 'exemplo.info@exemplo.com',
    },
    '4wn4ovkl': {
      'en': 'Copy',
      'es': 'Copiar',
      'pt': 'Cópia',
    },
    's785woxq': {
      'en': 'CV',
      'es': 'CV',
      'pt': 'cv',
    },
    '2tnlrcnx': {
      'en': 'LinkedIn',
      'es': 'LinkedIn',
      'pt': 'LinkedIn',
    },
    'ze12fhq9': {
      'en': 'X',
      'es': 'incógnita',
      'pt': 'X',
    },
    'k6zq6nyd': {
      'en':
          'Innovative Solutions in Web & Mobile Development for Seamless User Experiences',
      'es':
          'Soluciones innovadoras en desarrollo web y móvil para experiencias de usuario perfectas',
      'pt':
          'Soluções inovadoras em desenvolvimento web e móvel para experiências de usuário perfeitas',
    },
    '015dl0nm': {
      'en': 'BIOGRAPHY',
      'es': 'BIOGRAFÍA',
      'pt': 'BIOGRAFIA',
    },
    '3v5vb62t': {
      'en':
          'full-stack developer specializing in web and mobile apps, focusing on intuitive design and innovative AI solutions',
      'es':
          'Desarrollador full-stack especializado en aplicaciones web y móviles, centrado en el diseño intuitivo y soluciones innovadoras de inteligencia artificial.',
      'pt':
          'desenvolvedor full-stack especializado em aplicativos web e móveis, com foco em design intuitivo e soluções inovadoras de IA',
    },
    '6q91b9ot': {
      'en': 'SERVICES',
      'es': 'SERVICIOS',
      'pt': 'SERVIÇOS',
    },
    'ktpzd9nj': {
      'en':
          'Custom app development\nWeb development\nUI/UX design\nAI and automation solutions',
      'es':
          'Desarrollo de aplicaciones personalizadas\nDesarrollo web\nDiseño UI/UX\nSoluciones de IA y automatización',
      'pt':
          'Desenvolvimento de aplicativo personalizado\nDesenvolvimento web\nDesign de UI/UX\nSoluções de IA e automação',
    },
    'xym5oe2t': {
      'en': 'Hi, I\'m Carlos Roberto',
      'es': 'Hola soy Carlos Roberto',
      'pt': 'Olá, eu sou Carlos Roberto',
    },
    'm0hya8zs': {
      'en': 'YEARS OF \nEXPERIENCE',
      'es': 'AÑOS DE \nEXPERIENCIA',
      'pt': 'ANOS DE \nEXPERIÊNCIA',
    },
    'hjmkm5m1': {
      'en': '10',
      'es': '10',
      'pt': '10',
    },
    'jf910i90': {
      'en': 'CLIENTS \nSATISFACTION',
      'es': 'SATISFACCIÓN DE LOS CLIENTES',
      'pt': 'CLIENTES \nSATISFAÇÃO',
    },
    'x9hpcdpz': {
      'en': '100%',
      'es': '100%',
      'pt': '100%',
    },
    '22sgldzi': {
      'en': 'PROJECTS DONE',
      'es': 'PROYECTOS REALIZADOS',
      'pt': 'PROJETOS REALIZADOS',
    },
    'mxvkpn4c': {
      'en': '100%',
      'es': '100%',
      'pt': '100%',
    },
    'p2rtfj9l': {
      'en': 'Selected works',
      'es': 'Obras seleccionadas',
      'pt': 'Trabalhos selecionados',
    },
    'hb31z5l4': {
      'en': 'Foodie Finder',
      'es': 'Buscador de amantes de la comida',
      'pt': 'Localizador de Gastronomia',
    },
    '2a03cy2i': {
      'en': 'Web & Mobile Development',
      'es': 'Desarrollo web y móvil',
      'pt': 'Desenvolvimento Web e Móvel',
    },
    'u0f0vhdx': {
      'en': 'August 2024',
      'es': 'Agosto de 2024',
      'pt': 'Agosto de 2024',
    },
    '9zn5orkn': {
      'en':
          'An innovative application designed to help users discover nearby restaurants and food joints based on their preferences. Built using Flutter and integrated with Google Maps API, this app delivers location-based recommendations in real-time. The user interface focuses on a seamless experience for both food lovers and restaurant owners, including features like user reviews, real-time wait times, and delivery options.',
      'es':
          'Una aplicación innovadora diseñada para ayudar a los usuarios a descubrir restaurantes y establecimientos de comida cercanos según sus preferencias. Creada con Flutter e integrada con la API de Google Maps, esta aplicación ofrece recomendaciones basadas en la ubicación en tiempo real. La interfaz de usuario se centra en una experiencia perfecta tanto para los amantes de la comida como para los propietarios de restaurantes, e incluye funciones como reseñas de usuarios, tiempos de espera en tiempo real y opciones de entrega.',
      'pt':
          'Um aplicativo inovador projetado para ajudar os usuários a descobrir restaurantes e lanchonetes próximos com base em suas preferências. Construído usando Flutter e integrado com a API do Google Maps, este aplicativo fornece recomendações baseadas em localização em tempo real. A interface do usuário se concentra em uma experiência perfeita para amantes da comida e donos de restaurantes, incluindo recursos como avaliações de usuários, tempos de espera em tempo real e opções de entrega.',
    },
    'vk8okgx7': {
      'en': 'Button',
      'es': 'Botón',
      'pt': 'Botão',
    },
    '35utpik7': {
      'en': 'HealthTrack',
      'es': 'Seguimiento de la salud',
      'pt': 'Acompanhamento da Saúde',
    },
    'sv1qkkgk': {
      'en': 'Mobile Health App',
      'es': 'Aplicación de salud móvil',
      'pt': 'Aplicativo de saúde móvel',
    },
    '1wwh59g0': {
      'en': 'June 2024',
      'es': 'Junio de 2024',
      'pt': 'Junho de 2024',
    },
    'pn9e4xcg': {
      'en':
          'A personal health tracking app designed for Android and iOS. The app uses machine learning to predict and monitor user health metrics, providing insights into physical activity, sleep patterns, and heart rate. Built with Flutter and Firebase, the app integrates with wearable devices to provide real-time health updates.',
      'es':
          'Una aplicación de seguimiento de la salud personal diseñada para Android e iOS. La aplicación utiliza el aprendizaje automático para predecir y monitorear las métricas de salud del usuario, brindando información sobre la actividad física, los patrones de sueño y la frecuencia cardíaca. Desarrollada con Flutter y Firebase, la aplicación se integra con dispositivos portátiles para brindar actualizaciones de salud en tiempo real.',
      'pt':
          'Um aplicativo de monitoramento de saúde pessoal projetado para Android e iOS. O aplicativo usa aprendizado de máquina para prever e monitorar métricas de saúde do usuário, fornecendo insights sobre atividade física, padrões de sono e frequência cardíaca. Construído com Flutter e Firebase, o aplicativo se integra a dispositivos vestíveis para fornecer atualizações de saúde em tempo real.',
    },
    'kq5rxwyx': {
      'en': 'ShopEasy',
      'es': 'Compra Fácil',
      'pt': 'Compre Fácil',
    },
    'hsvkjyff': {
      'en': 'E-commerce Development',
      'es': 'Desarrollo de comercio electrónico',
      'pt': 'Desenvolvimento de comércio eletrônico',
    },
    'ophrin3z': {
      'en': 'July 2024',
      'es': 'Julio de 2024',
      'pt': 'Julho de 2024',
    },
    '0a926jwx': {
      'en':
          'A powerful yet minimalist e-commerce platform built using React and Node.js, focused on providing a smooth shopping experience. The platform allows multiple vendors to upload and manage their own products while using AI-driven recommendations to suggest products to customers. With Stripe integration for secure payments.',
      'es':
          'Una plataforma de comercio electrónico potente y minimalista creada con React y Node.js, enfocada en brindar una experiencia de compra fluida. La plataforma permite que varios vendedores carguen y administren sus propios productos mientras utilizan recomendaciones impulsadas por IA para sugerir productos a los clientes. Con integración con Stripe para pagos seguros.',
      'pt':
          'Uma plataforma de e-commerce poderosa, porém minimalista, construída usando React e Node.js, focada em fornecer uma experiência de compra tranquila. A plataforma permite que vários fornecedores carreguem e gerenciem seus próprios produtos enquanto usam recomendações orientadas por IA para sugerir produtos aos clientes. Com integração Stripe para pagamentos seguros.',
    },
    'y388nd4h': {
      'en': 'EduLearn',
      'es': 'Aprendizaje educativo',
      'pt': 'EduLearn',
    },
    'h2dftnch': {
      'en': 'Web Development',
      'es': 'Desarrollo web',
      'pt': 'Desenvolvimento Web',
    },
    'htghl383': {
      'en': 'April 2024',
      'es': 'Abril de 2024',
      'pt': 'Abril de 2024',
    },
    'b6dqcmn9': {
      'en':
          'A dynamic online learning platform for students and teachers. Built using Vue.js and Firebase, it offers video tutorials, assignments, and real-time quizzes. The platform provides an easy-to-use content management system for educators to create and upload learning materials. It features real-time communication.',
      'es':
          'Una plataforma de aprendizaje en línea dinámica para estudiantes y profesores. Desarrollada con Vue.js y Firebase, ofrece tutoriales en video, tareas y exámenes en tiempo real. La plataforma ofrece un sistema de gestión de contenido fácil de usar para que los educadores creen y carguen materiales de aprendizaje. Cuenta con comunicación en tiempo real.',
      'pt':
          'Uma plataforma de aprendizagem on-line dinâmica para alunos e professores. Construída usando Vue.js e Firebase, ela oferece tutoriais em vídeo, tarefas e questionários em tempo real. A plataforma fornece um sistema de gerenciamento de conteúdo fácil de usar para educadores criarem e carregarem materiais de aprendizagem. Ela apresenta comunicação em tempo real.',
    },
    '6umi1hvb': {
      'en': 'Services',
      'es': 'Servicios',
      'pt': 'Serviços',
    },
    'c8oasw5b': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario, me especializo en la creación de aplicaciones web y móviles sólidas que ofrecen funcionalidad.',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário, sou especialista em construir aplicativos web e móveis robustos que oferecem funcionalidade',
    },
    'ji5hyowk': {
      'en': 'Software Development Services',
      'es': 'Servicios de desarrollo de software',
      'pt': 'Serviços de desenvolvimento de software',
    },
    'ubfatk92': {
      'en':
          'Offering full-stack web and mobile application development with a focus on building scalable, efficient, and user-friendly software. Services include backend development, API integration, and database management.\nNote: Specializing in technologies like Flutter, Firebase, React, and Node.js for robust application performance.',
      'es':
          'Ofrecemos desarrollo de aplicaciones web y móviles integrales con un enfoque en la creación de software escalable, eficiente y fácil de usar. Los servicios incluyen desarrollo de backend, integración de API y administración de bases de datos.\nNota: Nos especializamos en tecnologías como Flutter, Firebase, React y Node.js para un rendimiento sólido de las aplicaciones.',
      'pt':
          'Oferecendo desenvolvimento de aplicativos móveis e web full-stack com foco na construção de software escalável, eficiente e amigável. Os serviços incluem desenvolvimento de backend, integração de API e gerenciamento de banco de dados.\nNota: Especialização em tecnologias como Flutter, Firebase, React e Node.js para desempenho robusto de aplicativos.',
    },
    '8nhkwdf5': {
      'en': 'UI/UX Design Consulting',
      'es': 'Consultoría de diseño UI/UX',
      'pt': 'Consultoria em Design UI/UX',
    },
    'zgknw305': {
      'en':
          'Providing expert consulting in user interface and user experience design to ensure that applications are not only functional but also intuitive and engaging. Focus on creating user-centric designs that enhance usability.\nNote: Custom wireframes and interactive prototypes available upon request.',
      'es':
          'Brindamos asesoramiento especializado en diseño de interfaz y experiencia de usuario para garantizar que las aplicaciones no solo sean funcionales, sino también intuitivas y atractivas. Nos centramos en crear diseños centrados en el usuario que mejoren la usabilidad.\nNota: wireframes personalizados y prototipos interactivos disponibles a pedido.',
      'pt':
          'Fornecendo consultoria especializada em design de interface de usuário e experiência do usuário para garantir que os aplicativos não sejam apenas funcionais, mas também intuitivos e envolventes. Foco na criação de designs centrados no usuário que melhoram a usabilidade.\nNota: Wireframes personalizados e protótipos interativos disponíveis mediante solicitação.',
    },
    'parfk2sg': {
      'en': 'API Integration & Automation',
      'es': 'Integración y automatización de API',
      'pt': 'Integração e automação de API',
    },
    'vimw2hy3': {
      'en':
          'Specializing in the integration of third-party APIs, such as payment gateways, social media, and cloud services. Automate processes and streamline operations with custom API solutions tailored to your business needs.\nNote: API solutions are scalable and built to handle high-traffic environments.',
      'es':
          'Especializado en la integración de API de terceros, como pasarelas de pago, redes sociales y servicios en la nube. Automatice procesos y agilice las operaciones con soluciones API personalizadas adaptadas a las necesidades de su negocio.\nNota: Las soluciones API son escalables y están diseñadas para manejar entornos de alto tráfico.',
      'pt':
          'Especializando-se na integração de APIs de terceiros, como gateways de pagamento, mídias sociais e serviços em nuvem. Automatize processos e otimize operações com soluções de API personalizadas adaptadas às necessidades do seu negócio.\nObservação: as soluções de API são escaláveis e criadas para lidar com ambientes de alto tráfego.',
    },
    'vj2x1go6': {
      'en': 'Cloud Deployment & DevOps',
      'es': 'Implementación en la nube y DevOps',
      'pt': 'Implantação de Nuvem e DevOps',
    },
    'tq5y9b7u': {
      'en':
          'Helping businesses deploy their applications on the cloud, leveraging platforms like AWS, Google Cloud, and Azure for scalability and performance. Offering continuous integration (CI) and continuous deployment (CD) pipelines to streamline development workflows.\nNote: Assistance in selecting the best cloud solution for your needs.',
      'es':
          'Ayudamos a las empresas a implementar sus aplicaciones en la nube, aprovechando plataformas como AWS, Google Cloud y Azure para lograr escalabilidad y rendimiento. Ofrecemos canales de integración continua (CI) e implementación continua (CD) para optimizar los flujos de trabajo de desarrollo.\nNota: Asistencia para seleccionar la mejor solución en la nube para sus necesidades.',
      'pt':
          'Ajudando empresas a implantar seus aplicativos na nuvem, aproveitando plataformas como AWS, Google Cloud e Azure para escalabilidade e desempenho. Oferecendo pipelines de integração contínua (CI) e implantação contínua (CD) para otimizar os fluxos de trabalho de desenvolvimento.\nObservação: Assistência na seleção da melhor solução de nuvem para suas necessidades.',
    },
    '6vrc4y1j': {
      'en': 'Project Management & Consulting',
      'es': 'Gestión de proyectos y consultoría',
      'pt': 'Gestão de Projetos e Consultoria',
    },
    '4xeyok02': {
      'en':
          'With experience in managing large-scale projects, offering consulting services to help businesses plan, strategize, and execute software development projects. Skilled in Agile methodologies, working with tools like Jira, ClickUp, and Trello for smooth project execution.\nNote: Available for both short-term and long-term consulting engagements.',
      'es':
          'Con experiencia en la gestión de proyectos a gran escala, ofrece servicios de consultoría para ayudar a las empresas a planificar, diseñar estrategias y ejecutar proyectos de desarrollo de software. Experto en metodologías ágiles y trabaja con herramientas como Jira, ClickUp y Trello para una ejecución fluida de proyectos.\nNota: Disponible para compromisos de consultoría a corto y largo plazo.',
      'pt':
          'Com experiência em gerenciamento de projetos de grande porte, oferecendo serviços de consultoria para ajudar empresas a planejar, criar estratégias e executar projetos de desenvolvimento de software. Habilidoso em metodologias Agile, trabalhando com ferramentas como Jira, ClickUp e Trello para execução tranquila de projetos.\nNota: Disponível para compromissos de consultoria de curto e longo prazo.',
    },
    'qaoperuq': {
      'en': 'Achievement',
      'es': 'Logro',
      'pt': 'Conquista',
    },
    'bxal4cen': {
      'en': '2st Place',
      'es': '2do lugar',
      'pt': '2º Lugar',
    },
    'rz3usux2': {
      'en': 'Achievement',
      'es': 'Logro',
      'pt': 'Conquista',
    },
    'jqh0a85m': {
      'en': 'App of the Year Award\n- 2023',
      'es': 'Premio a la aplicación del año\n- 2023',
      'pt': 'Prêmio de Aplicativo do Ano\n- 2023',
    },
    'soi2rj2t': {
      'en': 'Mobile Application Development',
      'es': 'Desarrollo de aplicaciones móviles',
      'pt': 'Desenvolvimento de aplicativos móveis',
    },
    'nnfqtorp': {
      'en': '1st Place',
      'es': '1er lugar',
      'pt': '1º Lugar',
    },
    'apy5ry3y': {
      'en': 'Design Challenge',
      'es': 'Desafío de diseño',
      'pt': 'Desafio de Design',
    },
    'wvp9kwv5': {
      'en': 'Top 10 on App Store for \nTech Apps',
      'es': 'Las 10 mejores aplicaciones tecnológicas en la App Store',
      'pt': 'Top 10 na App Store para\nAplicativos de tecnologia',
    },
    '2rpw3kso': {
      'en': 'Top 10 on appstore',
      'es': 'Los 10 mejores en la App Store',
      'pt': 'Top 10 na appstore',
    },
    'wss1squu': {
      'en': '2st Place',
      'es': '2do lugar',
      'pt': '2º Lugar',
    },
    'h20gjgyu': {
      'en': 'Design Challenge',
      'es': 'Desafío de diseño',
      'pt': 'Desafio de Design',
    },
    '0jmfj1jy': {
      'en': 'Best Developer Award',
      'es': 'Premio al mejor desarrollador',
      'pt': 'Prêmio de Melhor Desenvolvedor',
    },
    '3v1894sf': {
      'en': 'Web & Mobile Development',
      'es': 'Desarrollo web y móvil',
      'pt': 'Desenvolvimento Web e Móvel',
    },
    'kti6jvue': {
      'en': 'Success Stories',
      'es': 'Casos de éxito',
      'pt': 'Histórias de sucesso',
    },
    '5f03aexf': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario, me especializo en la creación de aplicaciones web y móviles sólidas que ofrecen funcionalidad.',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário, sou especialista em construir aplicativos web e móveis robustos que oferecem funcionalidade',
    },
    'swihwyx0': {
      'en': 'Project 1',
      'es': 'Proyecto 1',
      'pt': 'Projeto 1',
    },
    'sht13x6j': {
      'en': 'Project 2',
      'es': 'Proyecto 2',
      'pt': 'Projeto 2',
    },
    '0xrtjpju': {
      'en': 'Project 3',
      'es': 'Proyecto 3',
      'pt': 'Projeto 3',
    },
    'n26hguks': {
      'en': '6000',
      'es': '6000',
      'pt': '6000',
    },
    'i4vcjfes': {
      'en': 'A robust AI-powered platform designed ',
      'es': 'Una plataforma robusta impulsada por IA diseñada',
      'pt': 'Uma plataforma robusta alimentada por IA projetada',
    },
    'v20idocy': {
      'en': '300',
      'es': '300',
      'pt': '300',
    },
    'bdqm02zl': {
      'en': 'Over 300 successful projects delivered',
      'es': 'Más de 300 proyectos ejecutados con éxito',
      'pt': 'Mais de 300 projetos bem-sucedidos entregues',
    },
    '2vmb16en': {
      'en': '90%',
      'es': '90%',
      'pt': '90%',
    },
    'urmu2fgm': {
      'en': 'Maintained a 90% customer satisfaction rate across all projects',
      'es':
          'Mantuvo una tasa de satisfacción del cliente del 90% en todos los proyectos.',
      'pt':
          'Manteve uma taxa de satisfação do cliente de 90% em todos os projetos',
    },
    'mbedzt6e': {
      'en': '10%',
      'es': '10%',
      'pt': '10%',
    },
    'xdfce8m2': {
      'en': 'Thanks to strong word-of-mouth recommendations and high-quality',
      'es':
          'Gracias a las fuertes recomendaciones de boca en boca y a la alta calidad',
      'pt': 'Graças às fortes recomendações boca a boca e à alta qualidade',
    },
    '4v8wzmkb': {
      'en': 'S',
      'es': 'S',
      'pt': 'S',
    },
    '0dqhip7k': {
      'en': 'Let\'s Collaborate!',
      'es': '¡Colaboremos!',
      'pt': 'Vamos colaborar!',
    },
    '8ehthynp': {
      'en': 'Got an idea? Let’s bring it to life, together!',
      'es': '¿Tienes una idea? ¡Hagámosla realidad juntos!',
      'pt': 'Tem uma ideia? Vamos dar vida a ela, juntos!',
    },
    '39b7kya9': {
      'en': 'With a deep passion for technology and user-centric design',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario.',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário',
    },
    'a58lbaj4': {
      'en': 'Design Inquiry',
      'es': 'Consulta de diseño',
      'pt': 'Consulta de design',
    },
    'mll9sr25': {
      'en':
          'Need design help? Reach out now before your great idea fades into oblivion!',
      'es':
          '¿Necesitas ayuda con el diseño? ¡Contáctanos ahora antes de que tu gran idea se pierda en el olvido!',
      'pt':
          'Precisa de ajuda com design? Entre em contato agora antes que sua grande ideia caia no esquecimento!',
    },
    'a9kemjfz': {
      'en': 'Name',
      'es': 'Nombre',
      'pt': 'Nome',
    },
    'al70j42w': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'pt': 'Campo de texto',
    },
    'p9ca1btj': {
      'en': ' ',
      'es': '',
      'pt': '',
    },
    'erzt1m2n': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'pt': 'E-mail',
    },
    'fggwf2hc': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'pt': 'Campo de texto',
    },
    '4zjbgt7j': {
      'en': ' ',
      'es': '',
      'pt': '',
    },
    'he2teeov': {
      'en': 'Message',
      'es': 'Mensaje',
      'pt': 'Mensagem',
    },
    'b2mxkrmk': {
      'en':
          'Tell us all about your project, or at least enough to make us say, “Wow, let’s build this!”',
      'es':
          'Cuéntanos todo sobre tu proyecto, o al menos lo suficiente para que podamos decir: \"¡Guau, vamos a construirlo!\"',
      'pt':
          'Conte-nos tudo sobre seu projeto, ou pelo menos o suficiente para nos fazer dizer: \"Uau, vamos construir isso!\"',
    },
    'v7jeh2vu': {
      'en':
          'Innovative Solutions in \nWeb & Mobile \nDevelopment for \nSeamless User Experiences',
      'es':
          'Soluciones innovadoras en desarrollo\nweb y móvil para experiencias de usuario\nperfectas',
      'pt':
          'Soluções inovadoras em \nDesenvolvimento \nWeb e Mobile para \nExperiências de usuário perfeitas',
    },
    '2i058461': {
      'en': 'Hi, I\'m Sam Matter',
      'es': 'Hola, soy Sam Matter',
      'pt': 'Olá, eu sou Sam Matter',
    },
    'xstl4wpk': {
      'en': 'BIOGRAPHY',
      'es': 'BIOGRAFÍA',
      'pt': 'BIOGRAFIA',
    },
    'xdxpjm97': {
      'en':
          'full-stack developer specializing in web and mobile apps, focusing on intuitive design and innovative AI solutions',
      'es':
          'Desarrollador full-stack especializado en aplicaciones web y móviles, centrado en el diseño intuitivo y soluciones innovadoras de inteligencia artificial.',
      'pt':
          'desenvolvedor full-stack especializado em aplicativos web e móveis, com foco em design intuitivo e soluções inovadoras de IA',
    },
    'x9vdq6br': {
      'en': 'SERVICES',
      'es': 'SERVICIOS',
      'pt': 'SERVIÇOS',
    },
    '4y6el5ol': {
      'en':
          'Custom app development\nWeb development\nUI/UX design\nAI and automation solutions',
      'es':
          'Desarrollo de aplicaciones personalizadas\nDesarrollo web\nDiseño UI/UX\nSoluciones de IA y automatización',
      'pt':
          'Desenvolvimento de aplicativo personalizado\nDesenvolvimento web\nDesign de UI/UX\nSoluções de IA e automação',
    },
    'jizyjwpn': {
      'en': 'YEARS OF \nEXPERIENCE',
      'es': 'AÑOS DE \nEXPERIENCIA',
      'pt': 'ANOS DE \nEXPERIÊNCIA',
    },
    'o6kgyk55': {
      'en': '10',
      'es': '10',
      'pt': '10',
    },
    'x6cabf4z': {
      'en': 'CLIENTS \nSATISFACTION',
      'es': 'SATISFACCIÓN DE LOS CLIENTES',
      'pt': 'CLIENTES \nSATISFAÇÃO',
    },
    'pbwr0e5k': {
      'en': '100%',
      'es': '100%',
      'pt': '100%',
    },
    'sdvy4g42': {
      'en': 'PROJECTS \nDONE',
      'es': 'PROYECTOS \nREALIZADOS',
      'pt': 'PROJETOS \nCONCLUÍDOS',
    },
    'az5ta1l3': {
      'en': '100%',
      'es': '100%',
      'pt': '100%',
    },
    'rc8lg43d': {
      'en': 'Selected works',
      'es': 'Obras seleccionadas',
      'pt': 'Trabalhos selecionados',
    },
    'ftsfmrgm': {
      'en': 'Foodie Finder',
      'es': 'Buscador de amantes de la comida',
      'pt': 'Localizador de Gastronomia',
    },
    '6pal0r9v': {
      'en': 'Web & Mobile Development',
      'es': 'Desarrollo web y móvil',
      'pt': 'Desenvolvimento Web e Móvel',
    },
    '5mo73k5q': {
      'en': 'August 2024',
      'es': 'Agosto de 2024',
      'pt': 'Agosto de 2024',
    },
    'i83woqn9': {
      'en':
          'An innovative application designed to help users discover nearby restaurants and food joints based on their preferences. Built using Flutter and integrated with Google Maps API, this app delivers location-based recommendations in real-time. The user interface focuses on a seamless experience for both food lovers and restaurant owners, including features like user reviews, real-time wait times, and delivery options.',
      'es':
          'Una aplicación innovadora diseñada para ayudar a los usuarios a descubrir restaurantes y establecimientos de comida cercanos según sus preferencias. Creada con Flutter e integrada con la API de Google Maps, esta aplicación ofrece recomendaciones basadas en la ubicación en tiempo real. La interfaz de usuario se centra en una experiencia perfecta tanto para los amantes de la comida como para los propietarios de restaurantes, e incluye funciones como reseñas de usuarios, tiempos de espera en tiempo real y opciones de entrega.',
      'pt':
          'Um aplicativo inovador projetado para ajudar os usuários a descobrir restaurantes e lanchonetes próximos com base em suas preferências. Construído usando Flutter e integrado com a API do Google Maps, este aplicativo fornece recomendações baseadas em localização em tempo real. A interface do usuário se concentra em uma experiência perfeita para amantes da comida e donos de restaurantes, incluindo recursos como avaliações de usuários, tempos de espera em tempo real e opções de entrega.',
    },
    'dzgim6bn': {
      'en': 'Button',
      'es': 'Botón',
      'pt': 'Botão',
    },
    'kl3egr0k': {
      'en': 'HealthTrack',
      'es': 'Seguimiento de la salud',
      'pt': 'Acompanhamento da Saúde',
    },
    'k4zvqv49': {
      'en': 'Mobile Health App',
      'es': 'Aplicación de salud móvil',
      'pt': 'Aplicativo de saúde móvel',
    },
    'ie4hqjpc': {
      'en': 'June 2024',
      'es': 'Junio de 2024',
      'pt': 'Junho de 2024',
    },
    'xyra2qk4': {
      'en':
          'A personal health tracking app designed for Android and iOS. The app uses machine learning to predict and monitor user health metrics, providing insights into physical activity, sleep patterns, and heart rate. Built with Flutter and Firebase, the app integrates with wearable devices to provide real-time health updates.',
      'es':
          'Una aplicación de seguimiento de la salud personal diseñada para Android e iOS. La aplicación utiliza el aprendizaje automático para predecir y monitorear las métricas de salud del usuario, brindando información sobre la actividad física, los patrones de sueño y la frecuencia cardíaca. Desarrollada con Flutter y Firebase, la aplicación se integra con dispositivos portátiles para brindar actualizaciones de salud en tiempo real.',
      'pt':
          'Um aplicativo de monitoramento de saúde pessoal projetado para Android e iOS. O aplicativo usa aprendizado de máquina para prever e monitorar métricas de saúde do usuário, fornecendo insights sobre atividade física, padrões de sono e frequência cardíaca. Construído com Flutter e Firebase, o aplicativo se integra a dispositivos vestíveis para fornecer atualizações de saúde em tempo real.',
    },
    '3a47ct4j': {
      'en': 'ShopEasy',
      'es': 'Compra Fácil',
      'pt': 'Compre Fácil',
    },
    'nzkwm366': {
      'en': 'E-commerce Development',
      'es': 'Desarrollo de comercio electrónico',
      'pt': 'Desenvolvimento de comércio eletrônico',
    },
    'fz4yzoeu': {
      'en': 'July 2024',
      'es': 'Julio de 2024',
      'pt': 'Julho de 2024',
    },
    '1m32j3zw': {
      'en':
          'A powerful yet minimalist e-commerce platform built using React and Node.js, focused on providing a smooth shopping experience. The platform allows multiple vendors to upload and manage their own products while using AI-driven recommendations to suggest products to customers. With Stripe integration for secure payments.',
      'es':
          'Una plataforma de comercio electrónico potente y minimalista creada con React y Node.js, enfocada en brindar una experiencia de compra fluida. La plataforma permite que varios vendedores carguen y administren sus propios productos mientras utilizan recomendaciones impulsadas por IA para sugerir productos a los clientes. Con integración con Stripe para pagos seguros.',
      'pt':
          'Uma plataforma de e-commerce poderosa, porém minimalista, construída usando React e Node.js, focada em fornecer uma experiência de compra tranquila. A plataforma permite que vários fornecedores carreguem e gerenciem seus próprios produtos enquanto usam recomendações orientadas por IA para sugerir produtos aos clientes. Com integração Stripe para pagamentos seguros.',
    },
    '3h2o38bs': {
      'en': 'EduLearn',
      'es': 'Aprendizaje educativo',
      'pt': 'EduLearn',
    },
    'pmaatl4d': {
      'en': 'Web Development',
      'es': 'Desarrollo web',
      'pt': 'Desenvolvimento Web',
    },
    'fu44xn8g': {
      'en': 'April 2024',
      'es': 'Abril de 2024',
      'pt': 'Abril de 2024',
    },
    'ivbf3r3v': {
      'en':
          'A dynamic online learning platform for students and teachers. Built using Vue.js and Firebase, it offers video tutorials, assignments, and real-time quizzes. The platform provides an easy-to-use content management system for educators to create and upload learning materials. It features real-time communication.',
      'es':
          'Una plataforma de aprendizaje en línea dinámica para estudiantes y profesores. Desarrollada con Vue.js y Firebase, ofrece tutoriales en video, tareas y exámenes en tiempo real. La plataforma ofrece un sistema de gestión de contenido fácil de usar para que los educadores creen y carguen materiales de aprendizaje. Cuenta con comunicación en tiempo real.',
      'pt':
          'Uma plataforma de aprendizagem on-line dinâmica para alunos e professores. Construída usando Vue.js e Firebase, ela oferece tutoriais em vídeo, tarefas e questionários em tempo real. A plataforma fornece um sistema de gerenciamento de conteúdo fácil de usar para educadores criarem e carregarem materiais de aprendizagem. Ela apresenta comunicação em tempo real.',
    },
    'l0i2m688': {
      'en': 'Services',
      'es': 'Servicios',
      'pt': 'Serviços',
    },
    'pelhveec': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile\n applications that offer both functionality ',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario, me especializo en la creación de aplicaciones web y móviles sólidas que ofrecen funcionalidad',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário, sou especialista em construir aplicativos robustos para web e dispositivos móveis\nque oferecem funcionalidade',
    },
    'se6z0yxq': {
      'en': 'Software Dev',
      'es': 'Desarrollo de software',
      'pt': 'Desenvolvimento de software',
    },
    'pblrdym9': {
      'en':
          'Offering full-stack web and mobile application development with a focus on building scalable, efficient, and user-friendly software. Services include backend development, API integration, and database management.\nNote: Specializing in technologies like Flutter, Firebase, React, and Node.js for robust application performance.',
      'es':
          'Ofrecemos desarrollo de aplicaciones web y móviles integrales con un enfoque en la creación de software escalable, eficiente y fácil de usar. Los servicios incluyen desarrollo de backend, integración de API y administración de bases de datos.\nNota: Nos especializamos en tecnologías como Flutter, Firebase, React y Node.js para un rendimiento sólido de las aplicaciones.',
      'pt':
          'Oferecendo desenvolvimento de aplicativos móveis e web full-stack com foco na construção de software escalável, eficiente e amigável. Os serviços incluem desenvolvimento de backend, integração de API e gerenciamento de banco de dados.\nNota: Especialização em tecnologias como Flutter, Firebase, React e Node.js para desempenho robusto de aplicativos.',
    },
    'lslri5qi': {
      'en': 'UI/UX Design Consulting',
      'es': 'Consultoría de diseño UI/UX',
      'pt': 'Consultoria em Design UI/UX',
    },
    'jxjhrzmb': {
      'en':
          'Providing expert consulting in user interface and user experience design to ensure that applications are not only functional but also intuitive and engaging. Focus on creating user-centric designs that enhance usability.\nNote: Custom wireframes and interactive prototypes available upon request.',
      'es':
          'Brindamos asesoramiento especializado en diseño de interfaz y experiencia de usuario para garantizar que las aplicaciones no solo sean funcionales, sino también intuitivas y atractivas. Nos centramos en crear diseños centrados en el usuario que mejoren la usabilidad.\nNota: wireframes personalizados y prototipos interactivos disponibles a pedido.',
      'pt':
          'Fornecendo consultoria especializada em design de interface de usuário e experiência do usuário para garantir que os aplicativos não sejam apenas funcionais, mas também intuitivos e envolventes. Foco na criação de designs centrados no usuário que melhoram a usabilidade.\nNota: Wireframes personalizados e protótipos interativos disponíveis mediante solicitação.',
    },
    'kak8ahlc': {
      'en': 'API Integration & Automation',
      'es': 'Integración y automatización de API',
      'pt': 'Integração e automação de API',
    },
    'bxk4p0my': {
      'en':
          'Specializing in the integration of third-party APIs, such as payment gateways, social media, and cloud services. Automate processes and streamline operations with custom API solutions tailored to your business needs.\nNote: API solutions are scalable and built to handle high-traffic environments.',
      'es':
          'Especializado en la integración de API de terceros, como pasarelas de pago, redes sociales y servicios en la nube. Automatice procesos y agilice las operaciones con soluciones API personalizadas adaptadas a las necesidades de su negocio.\nNota: Las soluciones API son escalables y están diseñadas para manejar entornos de alto tráfico.',
      'pt':
          'Especializando-se na integração de APIs de terceiros, como gateways de pagamento, mídias sociais e serviços em nuvem. Automatize processos e otimize operações com soluções de API personalizadas adaptadas às necessidades do seu negócio.\nObservação: as soluções de API são escaláveis e criadas para lidar com ambientes de alto tráfego.',
    },
    'z5q1g6nv': {
      'en': 'Cloud Deployment & DevOps',
      'es': 'Implementación en la nube y DevOps',
      'pt': 'Implantação de Nuvem e DevOps',
    },
    'yszmlbi2': {
      'en':
          'Helping businesses deploy their applications on the cloud, leveraging platforms like AWS, Google Cloud, and Azure for scalability and performance. Offering continuous integration (CI) and continuous deployment (CD) pipelines to streamline development workflows.\nNote: Assistance in selecting the best cloud solution for your needs.',
      'es':
          'Ayudamos a las empresas a implementar sus aplicaciones en la nube, aprovechando plataformas como AWS, Google Cloud y Azure para lograr escalabilidad y rendimiento. Ofrecemos canales de integración continua (CI) e implementación continua (CD) para optimizar los flujos de trabajo de desarrollo.\nNota: Asistencia para seleccionar la mejor solución en la nube para sus necesidades.',
      'pt':
          'Ajudando empresas a implantar seus aplicativos na nuvem, aproveitando plataformas como AWS, Google Cloud e Azure para escalabilidade e desempenho. Oferecendo pipelines de integração contínua (CI) e implantação contínua (CD) para otimizar os fluxos de trabalho de desenvolvimento.\nObservação: Assistência na seleção da melhor solução de nuvem para suas necessidades.',
    },
    'ug20ufxq': {
      'en': 'Project Management',
      'es': 'Gestión de proyectos',
      'pt': 'Gerenciamento de projetos',
    },
    '8nghwxs2': {
      'en':
          'With experience in managing large-scale projects, offering consulting services to help businesses plan, strategize, and execute software development projects. Skilled in Agile methodologies, working with tools like Jira, ClickUp, and Trello for smooth project execution.\nNote: Available for both short-term and long-term consulting engagements.',
      'es':
          'Con experiencia en la gestión de proyectos a gran escala, ofrece servicios de consultoría para ayudar a las empresas a planificar, diseñar estrategias y ejecutar proyectos de desarrollo de software. Experto en metodologías ágiles y trabaja con herramientas como Jira, ClickUp y Trello para una ejecución fluida de proyectos.\nNota: Disponible para compromisos de consultoría a corto y largo plazo.',
      'pt':
          'Com experiência em gerenciamento de projetos de grande porte, oferecendo serviços de consultoria para ajudar empresas a planejar, criar estratégias e executar projetos de desenvolvimento de software. Habilidoso em metodologias Agile, trabalhando com ferramentas como Jira, ClickUp e Trello para execução tranquila de projetos.\nNota: Disponível para compromissos de consultoria de curto e longo prazo.',
    },
    'wyts6cb9': {
      'en': 'Achievement',
      'es': 'Logro',
      'pt': 'Conquista',
    },
    '05n29hfh': {
      'en': '2st Place',
      'es': '2do lugar',
      'pt': '2º Lugar',
    },
    'yshyk2ix': {
      'en': 'Achievement',
      'es': 'Logro',
      'pt': 'Conquista',
    },
    'tgu76jdh': {
      'en': 'App of the Year Award - 2023',
      'es': 'Premio a la aplicación del año 2023',
      'pt': 'Prêmio App do Ano - 2023',
    },
    'l5s6ylqc': {
      'en': 'Mobile Application Development',
      'es': 'Desarrollo de aplicaciones móviles',
      'pt': 'Desenvolvimento de aplicativos móveis',
    },
    '0tt5ltaz': {
      'en': '1st Place',
      'es': '1er lugar',
      'pt': '1º Lugar',
    },
    '188l9xsq': {
      'en': 'Design Challenge',
      'es': 'Desafío de diseño',
      'pt': 'Desafio de Design',
    },
    '57unc5oa': {
      'en': 'Top 10 on App Store for \nTech Apps',
      'es': 'Las 10 mejores aplicaciones tecnológicas en la App Store',
      'pt': 'Top 10 na App Store para\nAplicativos de tecnologia',
    },
    '9ghpb71n': {
      'en': 'Top 10 on appstore',
      'es': 'Los 10 mejores en la App Store',
      'pt': 'Top 10 na appstore',
    },
    'o9t7yoco': {
      'en': '2st Place',
      'es': '2do lugar',
      'pt': '2º Lugar',
    },
    'wdx858cq': {
      'en': 'Design Challenge',
      'es': 'Desafío de diseño',
      'pt': 'Desafio de Design',
    },
    'h6lnagjd': {
      'en': 'Best Developer Award',
      'es': 'Premio al mejor desarrollador',
      'pt': 'Prêmio de Melhor Desenvolvedor',
    },
    'y7dosrbd': {
      'en': 'Web & Mobile Development',
      'es': 'Desarrollo web y móvil',
      'pt': 'Desenvolvimento Web e Móvel',
    },
    'r58gysxo': {
      'en': 'Success Stories',
      'es': 'Casos de éxito',
      'pt': 'Histórias de sucesso',
    },
    'gcwpmfc0': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario, me especializo en la creación de aplicaciones web y móviles sólidas que ofrecen funcionalidad.',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário, sou especialista em construir aplicativos web e móveis robustos que oferecem funcionalidade',
    },
    '0hqdmswt': {
      'en': 'project 3',
      'es': 'Proyecto 3',
      'pt': 'projeto 3',
    },
    '4ql7mvqs': {
      'en': 'project 1',
      'es': 'Proyecto 1',
      'pt': 'projeto 1',
    },
    '69eyy6hc': {
      'en': 'project 2',
      'es': 'Proyecto 2',
      'pt': 'projeto 2',
    },
    'zmharaxa': {
      'en': '6000',
      'es': '6000',
      'pt': '6000',
    },
    'bn4qs147': {
      'en': 'help small businesses automate',
      'es': 'Ayudar a las pequeñas empresas a automatizar',
      'pt': 'ajudar pequenas empresas a automatizar',
    },
    'y5mckzu5': {
      'en': '300',
      'es': '300',
      'pt': '300',
    },
    'll4eenax': {
      'en': 'Over 300 successful projects delivered to  globe',
      'es': 'Más de 300 proyectos exitosos entregados en todo el mundo',
      'pt': 'Mais de 300 projetos bem-sucedidos entregues ao mundo',
    },
    'rks02ogq': {
      'en': '90%',
      'es': '90%',
      'pt': '90%',
    },
    '6ly0zulg': {
      'en': 'Maintained a 90% customer satisfaction rate across all projects',
      'es':
          'Mantuvo una tasa de satisfacción del cliente del 90% en todos los proyectos.',
      'pt':
          'Manteve uma taxa de satisfação do cliente de 90% em todos os projetos',
    },
    'c5zrh0sf': {
      'en': '10%',
      'es': '10%',
      'pt': '10%',
    },
    'x3tm4p3g': {
      'en': 'Thanks to strong word-of-mouth recommendations and high-quality',
      'es':
          'Gracias a las fuertes recomendaciones de boca en boca y a la alta calidad',
      'pt': 'Graças às fortes recomendações boca a boca e à alta qualidade',
    },
    'nq3utyac': {
      'en': 'S',
      'es': 'S',
      'pt': 'S',
    },
    'mi52rk1y': {
      'en': 'Let\'s Collaborate!',
      'es': '¡Colaboremos!',
      'pt': 'Vamos colaborar!',
    },
    'zr4b9q6d': {
      'en': 'Got an idea? Let’s bring it to life, together!',
      'es': '¿Tienes una idea? ¡Hagámosla realidad juntos!',
      'pt': 'Tem uma ideia? Vamos dar vida a ela, juntos!',
    },
    't74ccruf': {
      'en': 'With a deep passion for technology \nand user-centric design',
      'es':
          'Con una profunda pasión por la tecnología\ny el diseño centrado en el usuario',
      'pt':
          'Com uma profunda paixão por tecnologia\ne design centrado no usuário',
    },
    'me5y4s6l': {
      'en': 'Design Inquiry',
      'es': 'Consulta de diseño',
      'pt': 'Consulta de design',
    },
    'y3eqccxl': {
      'en':
          'Need design help? Reach out now before your great idea fades into oblivion!',
      'es':
          '¿Necesitas ayuda con el diseño? ¡Contáctanos ahora antes de que tu gran idea se pierda en el olvido!',
      'pt':
          'Precisa de ajuda com design? Entre em contato agora antes que sua grande ideia caia no esquecimento!',
    },
    'd4dpve5j': {
      'en': 'Name',
      'es': 'Nombre',
      'pt': 'Nome',
    },
    'l4gtz13e': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'pt': 'Campo de texto',
    },
    'ovmmz1nm': {
      'en': ' ',
      'es': '',
      'pt': '',
    },
    'nfrfuryz': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'pt': 'E-mail',
    },
    'j76plwbi': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'pt': 'Campo de texto',
    },
    '7cu05tzp': {
      'en': ' ',
      'es': '',
      'pt': '',
    },
    '3midnuz4': {
      'en': 'Message',
      'es': 'Mensaje',
      'pt': 'Mensagem',
    },
    '2f15vpkw': {
      'en':
          'Tell us all about your project, or at least enough to make us say, “Wow, let’s build this!”',
      'es':
          'Cuéntanos todo sobre tu proyecto, o al menos lo suficiente para que podamos decir: \"¡Guau, vamos a construirlo!\"',
      'pt':
          'Conte-nos tudo sobre seu projeto, ou pelo menos o suficiente para nos fazer dizer: \"Uau, vamos construir isso!\"',
    },
    'zqo1rdil': {
      'en':
          'Innovative Solutions in \nWeb & Mobile \nDevelopment for \nSeamless User Experiences',
      'es':
          'Soluciones innovadoras en desarrollo \nweb y móvil para \nexperiencias de usuario perfectas',
      'pt':
          'Soluções inovadoras em \nDesenvolvimento \nWeb e Mobile para \nExperiências de usuário perfeitas',
    },
    'jhfdlo80': {
      'en': 'Hi, I\'m Sam Matter',
      'es': 'Hola, soy Sam Matter',
      'pt': 'Olá, eu sou Sam Matter',
    },
    'y38kig7p': {
      'en': 'YEARS OF \nEXPERIENCE',
      'es': 'AÑOS DE \nEXPERIENCIA',
      'pt': 'ANOS DE \nEXPERIÊNCIA',
    },
    'yytqdyfd': {
      'en': '10',
      'es': '10',
      'pt': '10',
    },
    '0udrm3mp': {
      'en': 'CLIENTS \nSATISFACTION',
      'es': 'SATISFACCIÓN DE LOS CLIENTES',
      'pt': 'CLIENTES \nSATISFAÇÃO',
    },
    '8v7m28xn': {
      'en': '100%',
      'es': '100%',
      'pt': '100%',
    },
    'uhytyy9v': {
      'en': 'PROJECTS \nDONE',
      'es': 'PROYECTOS \nREALIZADOS',
      'pt': 'PROJETOS \nCONCLUÍDOS',
    },
    '8wmpivtp': {
      'en': '100%',
      'es': '100%',
      'pt': '100%',
    },
    'tlovx769': {
      'en': 'BIOGRAPHY',
      'es': 'BIOGRAFÍA',
      'pt': 'BIOGRAFIA',
    },
    'jeep9py6': {
      'en':
          'full-stack developer specializing in web and mobile apps, focusing on intuitive design and innovative AI solutions',
      'es':
          'Desarrollador full-stack especializado en aplicaciones web y móviles, centrado en diseño intuitivo y soluciones innovadoras de inteligencia artificial.',
      'pt':
          'desenvolvedor full-stack especializado em aplicativos web e móveis, com foco em design intuitivo e soluções inovadoras de IA',
    },
    'c5quzjre': {
      'en': 'SERVICES',
      'es': 'SERVICIOS',
      'pt': 'SERVIÇOS',
    },
    '9pk8yqsl': {
      'en':
          'Custom app development\nWeb development\nUI/UX design\nAI and automation solutions',
      'es':
          'Desarrollo de aplicaciones personalizadas\nDesarrollo web\nDiseño UI/UX\nSoluciones de IA y automatización',
      'pt':
          'Desenvolvimento de aplicativo personalizado\nDesenvolvimento web\nDesign de UI/UX\nSoluções de IA e automação',
    },
    'n82dsill': {
      'en': 'Selected works',
      'es': 'Obras seleccionadas',
      'pt': 'Trabalhos selecionados',
    },
    '0hkuqlw7': {
      'en': 'Foodie Finder',
      'es': 'Buscador de amantes de la comida',
      'pt': 'Localizador de Gastronomia',
    },
    'ig7chjzv': {
      'en': 'Web & Mobile Development',
      'es': 'Desarrollo web y móvil',
      'pt': 'Desenvolvimento Web e Móvel',
    },
    'u5nuf6af': {
      'en': 'August 2024',
      'es': 'Agosto de 2024',
      'pt': 'Agosto de 2024',
    },
    'h0n2hsim': {
      'en':
          'An innovative application designed to help users discover nearby restaurants and food joints based on their preferences. Built using Flutter and integrated with Google Maps API, this app delivers location-based recommendations in real-time. The user interface focuses on a seamless experience for both food lovers and restaurant owners, including features like user reviews, real-time wait times, and delivery options.',
      'es':
          'Una aplicación innovadora diseñada para ayudar a los usuarios a descubrir restaurantes y establecimientos de comida cercanos según sus preferencias. Creada con Flutter e integrada con la API de Google Maps, esta aplicación ofrece recomendaciones basadas en la ubicación en tiempo real. La interfaz de usuario se centra en una experiencia perfecta tanto para los amantes de la comida como para los propietarios de restaurantes, e incluye funciones como reseñas de usuarios, tiempos de espera en tiempo real y opciones de entrega.',
      'pt':
          'Um aplicativo inovador projetado para ajudar os usuários a descobrir restaurantes e lanchonetes próximos com base em suas preferências. Construído usando Flutter e integrado com a API do Google Maps, este aplicativo fornece recomendações baseadas em localização em tempo real. A interface do usuário se concentra em uma experiência perfeita para amantes da comida e donos de restaurantes, incluindo recursos como avaliações de usuários, tempos de espera em tempo real e opções de entrega.',
    },
    'vh5v95zz': {
      'en': 'Button',
      'es': 'Botón',
      'pt': 'Botão',
    },
    'h1sbwyd3': {
      'en': 'HealthTrack',
      'es': 'Seguimiento de la salud',
      'pt': 'Acompanhamento da Saúde',
    },
    'xfzwqyyk': {
      'en': 'Mobile Health App',
      'es': 'Aplicación de salud móvil',
      'pt': 'Aplicativo de saúde móvel',
    },
    'fjaeht1q': {
      'en': 'June 2024',
      'es': 'Junio de 2024',
      'pt': 'Junho de 2024',
    },
    'q5kvocw3': {
      'en':
          'A personal health tracking app designed for Android and iOS. The app uses machine learning to predict and monitor user health metrics, providing insights into physical activity, sleep patterns, and heart rate. Built with Flutter and Firebase, the app integrates with wearable devices to provide real-time health updates.',
      'es':
          'Una aplicación de seguimiento de la salud personal diseñada para Android e iOS. La aplicación utiliza el aprendizaje automático para predecir y monitorear las métricas de salud del usuario, brindando información sobre la actividad física, los patrones de sueño y la frecuencia cardíaca. Desarrollada con Flutter y Firebase, la aplicación se integra con dispositivos portátiles para brindar actualizaciones de salud en tiempo real.',
      'pt':
          'Um aplicativo de monitoramento de saúde pessoal projetado para Android e iOS. O aplicativo usa aprendizado de máquina para prever e monitorar métricas de saúde do usuário, fornecendo insights sobre atividade física, padrões de sono e frequência cardíaca. Construído com Flutter e Firebase, o aplicativo se integra a dispositivos vestíveis para fornecer atualizações de saúde em tempo real.',
    },
    'a3lw9xv1': {
      'en': 'ShopEasy',
      'es': 'Compra Fácil',
      'pt': 'Compre Fácil',
    },
    '8gnfxlu6': {
      'en': 'E-commerce Development',
      'es': 'Desarrollo de comercio electrónico',
      'pt': 'Desenvolvimento de comércio eletrônico',
    },
    '10io9was': {
      'en': 'July 2024',
      'es': 'Julio de 2024',
      'pt': 'Julho de 2024',
    },
    'bp61qn36': {
      'en':
          'A powerful yet minimalist e-commerce platform built using React and Node.js, focused on providing a smooth shopping experience. The platform allows multiple vendors to upload and manage their own products while using AI-driven recommendations to suggest products to customers. With Stripe integration for secure payments.',
      'es':
          'Una plataforma de comercio electrónico potente y minimalista creada con React y Node.js, enfocada en brindar una experiencia de compra fluida. La plataforma permite que varios vendedores carguen y administren sus propios productos mientras utilizan recomendaciones impulsadas por IA para sugerir productos a los clientes. Con integración con Stripe para pagos seguros.',
      'pt':
          'Uma plataforma de e-commerce poderosa, porém minimalista, construída usando React e Node.js, focada em fornecer uma experiência de compra tranquila. A plataforma permite que vários fornecedores carreguem e gerenciem seus próprios produtos enquanto usam recomendações orientadas por IA para sugerir produtos aos clientes. Com integração Stripe para pagamentos seguros.',
    },
    's1wf6o42': {
      'en': 'EduLearn',
      'es': 'Aprendizaje educativo',
      'pt': 'EduLearn',
    },
    'mtu63wa1': {
      'en': 'Web Development',
      'es': 'Desarrollo web',
      'pt': 'Desenvolvimento Web',
    },
    '5r0ozyw0': {
      'en': 'April 2024',
      'es': 'Abril de 2024',
      'pt': 'Abril de 2024',
    },
    'p7vu7rzn': {
      'en':
          'A dynamic online learning platform for students and teachers. Built using Vue.js and Firebase, it offers video tutorials, assignments, and real-time quizzes. The platform provides an easy-to-use content management system for educators to create and upload learning materials. It features real-time communication.',
      'es':
          'Una plataforma de aprendizaje en línea dinámica para estudiantes y profesores. Desarrollada con Vue.js y Firebase, ofrece tutoriales en video, tareas y exámenes en tiempo real. La plataforma ofrece un sistema de gestión de contenido fácil de usar para que los educadores creen y carguen materiales de aprendizaje. Cuenta con comunicación en tiempo real.',
      'pt':
          'Uma plataforma de aprendizagem on-line dinâmica para alunos e professores. Construída usando Vue.js e Firebase, ela oferece tutoriais em vídeo, tarefas e questionários em tempo real. A plataforma fornece um sistema de gerenciamento de conteúdo fácil de usar para educadores criarem e carregarem materiais de aprendizagem. Ela apresenta comunicação em tempo real.',
    },
    'usk6ywc8': {
      'en': 'Services',
      'es': 'Servicios',
      'pt': 'Serviços',
    },
    'hd7xylb4': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile\n applications that offer both functionality ',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario, me especializo en la creación de aplicaciones web y móviles sólidas que ofrecen funcionalidad',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário, sou especialista em construir aplicativos robustos para web e dispositivos móveis\nque oferecem funcionalidade',
    },
    '93ebw1r6': {
      'en': 'Software Dev',
      'es': 'Desarrollo de software',
      'pt': 'Desenvolvimento de software',
    },
    'p78llq1m': {
      'en':
          'Offering full-stack web and mobile application development with a focus on building scalable, efficient, and user-friendly software. Services include backend development, API integration, and database management.\nNote: Specializing in technologies like Flutter, Firebase, React, and Node.js for robust application performance.',
      'es':
          'Ofrecemos desarrollo de aplicaciones web y móviles integrales con un enfoque en la creación de software escalable, eficiente y fácil de usar. Los servicios incluyen desarrollo de backend, integración de API y administración de bases de datos.\nNota: Nos especializamos en tecnologías como Flutter, Firebase, React y Node.js para un rendimiento sólido de las aplicaciones.',
      'pt':
          'Oferecendo desenvolvimento de aplicativos móveis e web full-stack com foco na construção de software escalável, eficiente e amigável. Os serviços incluem desenvolvimento de backend, integração de API e gerenciamento de banco de dados.\nNota: Especialização em tecnologias como Flutter, Firebase, React e Node.js para desempenho robusto de aplicativos.',
    },
    '0ymhhtol': {
      'en': 'UI/UX Design Consulting',
      'es': 'Consultoría de diseño UI/UX',
      'pt': 'Consultoria em Design UI/UX',
    },
    'wgpqzix2': {
      'en':
          'Providing expert consulting in user interface and user experience design to ensure that applications are not only functional but also intuitive and engaging. Focus on creating user-centric designs that enhance usability.\nNote: Custom wireframes and interactive prototypes available upon request.',
      'es':
          'Brindamos asesoramiento especializado en diseño de interfaz y experiencia de usuario para garantizar que las aplicaciones no solo sean funcionales, sino también intuitivas y atractivas. Nos centramos en crear diseños centrados en el usuario que mejoren la usabilidad.\nNota: wireframes personalizados y prototipos interactivos disponibles a pedido.',
      'pt':
          'Fornecendo consultoria especializada em design de interface de usuário e experiência do usuário para garantir que os aplicativos não sejam apenas funcionais, mas também intuitivos e envolventes. Foco na criação de designs centrados no usuário que melhoram a usabilidade.\nNota: Wireframes personalizados e protótipos interativos disponíveis mediante solicitação.',
    },
    'pf3l7bad': {
      'en': 'API Integration & Automation',
      'es': 'Integración y automatización de API',
      'pt': 'Integração e automação de API',
    },
    'r9gickg3': {
      'en':
          'Specializing in the integration of third-party APIs, such as payment gateways, social media, and cloud services. Automate processes and streamline operations with custom API solutions tailored to your business needs.\nNote: API solutions are scalable and built to handle high-traffic environments.',
      'es':
          'Especializado en la integración de API de terceros, como pasarelas de pago, redes sociales y servicios en la nube. Automatice procesos y agilice las operaciones con soluciones API personalizadas adaptadas a las necesidades de su negocio.\nNota: Las soluciones API son escalables y están diseñadas para manejar entornos de alto tráfico.',
      'pt':
          'Especializando-se na integração de APIs de terceiros, como gateways de pagamento, mídias sociais e serviços em nuvem. Automatize processos e otimize operações com soluções de API personalizadas adaptadas às necessidades do seu negócio.\nObservação: as soluções de API são escaláveis e criadas para lidar com ambientes de alto tráfego.',
    },
    '683g2j2a': {
      'en': 'Cloud Deployment & DevOps',
      'es': 'Implementación en la nube y DevOps',
      'pt': 'Implantação de Nuvem e DevOps',
    },
    'x1lmsnw7': {
      'en':
          'Helping businesses deploy their applications on the cloud, leveraging platforms like AWS, Google Cloud, and Azure for scalability and performance. Offering continuous integration (CI) and continuous deployment (CD) pipelines to streamline development workflows.\nNote: Assistance in selecting the best cloud solution for your needs.',
      'es':
          'Ayudamos a las empresas a implementar sus aplicaciones en la nube, aprovechando plataformas como AWS, Google Cloud y Azure para lograr escalabilidad y rendimiento. Ofrecemos canales de integración continua (CI) e implementación continua (CD) para optimizar los flujos de trabajo de desarrollo.\nNota: Asistencia para seleccionar la mejor solución en la nube para sus necesidades.',
      'pt':
          'Ajudando empresas a implantar seus aplicativos na nuvem, aproveitando plataformas como AWS, Google Cloud e Azure para escalabilidade e desempenho. Oferecendo pipelines de integração contínua (CI) e implantação contínua (CD) para otimizar os fluxos de trabalho de desenvolvimento.\nObservação: Assistência na seleção da melhor solução de nuvem para suas necessidades.',
    },
    '5ginmalr': {
      'en': 'Project Management',
      'es': 'Gestión de proyectos',
      'pt': 'Gerenciamento de projetos',
    },
    'v9x1q6k0': {
      'en':
          'With experience in managing large-scale projects, offering consulting services to help businesses plan, strategize, and execute software development projects. Skilled in Agile methodologies, working with tools like Jira, ClickUp, and Trello for smooth project execution.\nNote: Available for both short-term and long-term consulting engagements.',
      'es':
          'Con experiencia en la gestión de proyectos a gran escala, ofrece servicios de consultoría para ayudar a las empresas a planificar, diseñar estrategias y ejecutar proyectos de desarrollo de software. Experto en metodologías ágiles y trabaja con herramientas como Jira, ClickUp y Trello para una ejecución fluida de proyectos.\nNota: Disponible para compromisos de consultoría a corto y largo plazo.',
      'pt':
          'Com experiência em gerenciamento de projetos de grande porte, oferecendo serviços de consultoria para ajudar empresas a planejar, criar estratégias e executar projetos de desenvolvimento de software. Habilidoso em metodologias Agile, trabalhando com ferramentas como Jira, ClickUp e Trello para execução tranquila de projetos.\nNota: Disponível para compromissos de consultoria de curto e longo prazo.',
    },
    'xi9gnhxz': {
      'en': 'Achievement',
      'es': 'Logro',
      'pt': 'Conquista',
    },
    'byoa7kpg': {
      'en': '2st Place',
      'es': '2do lugar',
      'pt': '2º Lugar',
    },
    'whhzylly': {
      'en': 'Achievement',
      'es': 'Logro',
      'pt': 'Conquista',
    },
    'pykm2a49': {
      'en': 'App of the Year Award - 2023',
      'es': 'Premio a la aplicación del año 2023',
      'pt': 'Prêmio App do Ano - 2023',
    },
    '5va2swmf': {
      'en': 'Mobile Application Development',
      'es': 'Desarrollo de aplicaciones móviles',
      'pt': 'Desenvolvimento de aplicativos móveis',
    },
    'pwn8jb3o': {
      'en': '1st Place',
      'es': '1er lugar',
      'pt': '1º Lugar',
    },
    'xtskpvge': {
      'en': 'Design Challenge',
      'es': 'Desafío de diseño',
      'pt': 'Desafio de Design',
    },
    'zf12z5fu': {
      'en': 'Top 10 on App Store for \nTech Apps',
      'es': 'Las 10 mejores aplicaciones tecnológicas en la App Store',
      'pt': 'Top 10 na App Store para\nAplicativos de tecnologia',
    },
    'ztp4s3xi': {
      'en': 'Top 10 on appstore',
      'es': 'Los 10 mejores en la App Store',
      'pt': 'Top 10 na appstore',
    },
    'yfwe76kq': {
      'en': '2st Place',
      'es': '2do lugar',
      'pt': '2º Lugar',
    },
    'lloc6fqi': {
      'en': 'Design Challenge',
      'es': 'Desafío de diseño',
      'pt': 'Desafio de Design',
    },
    'tx47ol8g': {
      'en': 'Best Developer Award',
      'es': 'Premio al mejor desarrollador',
      'pt': 'Prêmio de Melhor Desenvolvedor',
    },
    'brrtp2kx': {
      'en': 'Web & Mobile Development',
      'es': 'Desarrollo web y móvil',
      'pt': 'Desenvolvimento Web e Móvel',
    },
    'sq9y6faa': {
      'en': 'Success Stories',
      'es': 'Casos de éxito',
      'pt': 'Histórias de sucesso',
    },
    'yx8x9m3u': {
      'en':
          'With a deep passion for technology and user-centric design, I specialize in building robust web and mobile applications that offer both functionality ',
      'es':
          'Con una profunda pasión por la tecnología y el diseño centrado en el usuario, me especializo en la creación de aplicaciones web y móviles sólidas que ofrecen funcionalidad.',
      'pt':
          'Com uma profunda paixão por tecnologia e design centrado no usuário, sou especialista em construir aplicativos web e móveis robustos que oferecem funcionalidade',
    },
    'dvh9al1j': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'pt': 'Olá Mundo',
    },
    'cywfvsrj': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'pt': 'Olá Mundo',
    },
    'zm7ea78w': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'pt': 'Olá Mundo',
    },
    '7iswi1bk': {
      'en': '6000',
      'es': '6000',
      'pt': '6000',
    },
    'hca368u6': {
      'en': 'help small businesses automate',
      'es': 'Ayudar a las pequeñas empresas a automatizar',
      'pt': 'ajudar pequenas empresas a automatizar',
    },
    'cd69phbl': {
      'en': '300',
      'es': '300',
      'pt': '300',
    },
    'zi03fvcb': {
      'en': 'Over 300 successful projects delivered to  globe',
      'es': 'Más de 300 proyectos exitosos entregados en todo el mundo',
      'pt': 'Mais de 300 projetos bem-sucedidos entregues ao mundo',
    },
    'f81uu0tn': {
      'en': '90%',
      'es': '90%',
      'pt': '90%',
    },
    'kgdl1o9e': {
      'en': 'Maintained a 90% customer satisfaction rate across all projects',
      'es':
          'Mantuvo una tasa de satisfacción del cliente del 90% en todos los proyectos.',
      'pt':
          'Manteve uma taxa de satisfação do cliente de 90% em todos os projetos',
    },
    'i3iampye': {
      'en': '10%',
      'es': '10%',
      'pt': '10%',
    },
    'axgs7to2': {
      'en': 'Thanks to strong word-of-mouth recommendations and high-quality',
      'es':
          'Gracias a las fuertes recomendaciones de boca en boca y a la alta calidad',
      'pt': 'Graças às fortes recomendações boca a boca e à alta qualidade',
    },
    's127kbwd': {
      'en': 'S',
      'es': 'S',
      'pt': 'S',
    },
    '1tfuczkz': {
      'en': 'Let\'s Collaborate!',
      'es': '¡Colaboremos!',
      'pt': 'Vamos colaborar!',
    },
    'tr7u9jk9': {
      'en': 'Got an idea? Let’s bring it to life, together!',
      'es': '¿Tienes una idea? ¡Hagámosla realidad juntos!',
      'pt': 'Tem uma ideia? Vamos dar vida a ela, juntos!',
    },
    '316rbyno': {
      'en': 'With a deep passion for technology \nand user-centric design',
      'es':
          'Con una profunda pasión por la tecnología\ny el diseño centrado en el usuario',
      'pt':
          'Com uma profunda paixão por tecnologia\ne design centrado no usuário',
    },
    '2nigozep': {
      'en': 'Design Inquiry',
      'es': 'Consulta de diseño',
      'pt': 'Consulta de design',
    },
    'eirr5chn': {
      'en':
          'Need design help? Reach out now before your great idea fades into oblivion!',
      'es':
          '¿Necesitas ayuda con el diseño? ¡Contáctanos ahora antes de que tu gran idea se pierda en el olvido!',
      'pt':
          'Precisa de ajuda com design? Entre em contato agora antes que sua grande ideia caia no esquecimento!',
    },
    'bij1gue6': {
      'en': 'Name',
      'es': 'Nombre',
      'pt': 'Nome',
    },
    'ouvhn1yt': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'pt': 'Campo de texto',
    },
    'cz9uvn72': {
      'en': ' ',
      'es': '',
      'pt': '',
    },
    'h8vtqclv': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'pt': 'E-mail',
    },
    'odcmez8q': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'pt': 'Campo de texto',
    },
    '6dy5dvg6': {
      'en': ' ',
      'es': '',
      'pt': '',
    },
    'g5fhu6pn': {
      'en': 'Message',
      'es': 'Mensaje',
      'pt': 'Mensagem',
    },
    'mzu10dzk': {
      'en':
          'Tell us all about your project, or at least enough to make us say, “Wow, let’s build this!”',
      'es':
          'Cuéntanos todo sobre tu proyecto, o al menos lo suficiente para que podamos decir: \"¡Guau, vamos a construirlo!\"',
      'pt':
          'Conte-nos tudo sobre seu projeto, ou pelo menos o suficiente para nos fazer dizer: \"Uau, vamos construir isso!\"',
    },
    '33hamzid': {
      'en': 'Home',
      'es': 'Hogar',
      'pt': 'Lar',
    },
  },
  // Miscellaneous
  {
    'td7hm3t0': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'frb18ov9': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'p0a337z5': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'bh1cnn6k': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'wwj8xu03': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '28pvh6ai': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'ye62kqu3': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '5tdpc26f': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'kfjv95v8': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'utwev7p8': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'b4uf4y6o': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'a3y5je0o': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'oprawkwg': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'q2vkln5q': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'xlpg72qd': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'c5j73kc9': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'qwmzc2n9': {
      'en': '',
      'es': '',
      'pt': '',
    },
    '3qesjyzu': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'ri7zgswe': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'asofzoxk': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'xl8vlfie': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'tw5n0es2': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'whj2nnou': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'lfd92qjs': {
      'en': '',
      'es': '',
      'pt': '',
    },
    'ldegtu6g': {
      'en': '',
      'es': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
