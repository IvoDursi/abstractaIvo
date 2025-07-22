# 📝 Task Manager App (Prueba Técnica)

Esta aplicación Flutter permite gestionar tareas de forma eficiente, brindando una experiencia fluida y adaptativa tanto para Android como para iOS. Incluye generación de descripciones mediante IA, estadísticas, persistencia local y una arquitectura modular y escalable.

## 🚀 Ejecución rápida

Esta es una **app privada**, ya incluye el archivo `.env` con la clave de Gemini necesaria.

1. **Instalar dependencias**
   ```bash
   flutter pub get
   ```
2. **Ejecutar la app**

   Para todos los entornos, ejecutar siempre con el flavor `production` y el entrypoint `main_production.dart`:
   ```bash
   flutter run --flavor production -t lib/main_production.dart
   ```

La app corre en **Android** e **iOS** (emulador o dispositivo real). en **Android** e **iOS** (emulador o dispositivo real).

---

## ✅ Funcionalidades principales

1. **Gestión de Tareas**: crear, editar, eliminar y marcar tareas como completadas o pendientes. Cada tarea tiene Título, Descripción, Etiquetas, Estado y Usuario asignado.
2. **Estadísticas**: vista con comparación de tareas completadas vs pendientes, mostrada en gráfico y texto.
3. **Asistente IA (LLM)**: al crear una tarea, elegir entre modo IA (prompt a Gemini) o modo manual.
4. **Estado y rendimiento**: arquitectura en capas based en Very Good Flutter Architecture; uso de Bloc para estado predecible y UI optimizada.
5. **Diseño multiplataforma**: estilo Cupertino para iOS y Material para Android; FAB con comportamiento específico.
6. **Tema oscuro**: se activa automáticamente según configuración del dispositivo.
7. **Internacionalización**: Español e Inglés según idioma del sistema.
8. **Persistencia local**: almacenamiento de tareas en Hive para uso offline.

---

## 🧪 Pruebas incluidas

- **Unitarias** (`test/bloc/`):

  - `statistics_bloc_test.dart`
  - `task_action_bloc_test.dart`
  - `tasks_bloc_test.dart`

- **Widgets** (`test/view/`):

  - `home_page_test.dart`
  - `statistics_page_test.dart`
  - `tasks_page_test.dart`

## 🧠 Detalles de implementación

- **Arquitectura**: Capas siguiendo Very Good Flutter Architecture
- **Estado**: Bloc para `TasksBloc`, `TaskActionBloc` y `StatisticsBloc`
- **Persistencia**: Hive
- **IA**: Integración con API Gemini
- **Adaptabilidad**: Widgets que cambian entre Cupertino y Material
- **Tema e idiomas**: Detección automática según dispositivo



