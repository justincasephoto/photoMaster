# 📷 Sistema de fotos compartidas

Un sistema minimalista para compartir fotos con personas que fotografías espontáneamente.  
Stack: HTML puro · Vercel (gratis) · Google Drive (gratis) · Tally.so (gratis)

---

## Estructura del proyecto

```
/
├── index.html                          ← Landing page (plantilla maestra)
├── vercel.json                         ← Configuración de Vercel
├── admin/
│   └── index.html                      ← Tu panel de administración
└── sessions/
    └── marta-lazienki-abc123/
        └── index.html                  ← Una sesión = una persona
```

---

## Setup inicial (una sola vez)

### 1. GitHub
1. Crea una cuenta en [github.com](https://github.com) si no tienes
2. Crea un repositorio nuevo, llámalo `foto` o el nombre que quieras
3. Sube todos estos archivos

### 2. Vercel
1. Entra a [vercel.com](https://vercel.com) con tu cuenta de GitHub
2. Clic en "Add New Project" → importa tu repositorio
3. Clic en "Deploy" — en 2 minutos tienes tu URL

Tu URL base quedará algo como: `https://foto-abc.vercel.app`

### 3. Edita tu configuración base
En `index.html`, busca el objeto `SESSION` y cambia:
```js
photographer: "@TU_USUARIO_REAL",
ig_url: "https://instagram.com/TU_USUARIO_REAL",
phone_blik: "+48 TU_NUMERO",
tally_form_url: "https://tally.so/r/TU_FORM_ID",  // ver paso 4
```

### 4. Tally (formulario de notificación)
1. Entra a [tally.so](https://tally.so) y crea una cuenta gratis
2. Crea un formulario nuevo con estos campos:
   - Campo de texto: `name` (nombre de la persona)
   - Campo URL: `story` (link de la historia)
   - Campo oculto: `photographer`
3. En Notificaciones → activa "Email notification" con tu email
4. Copia la URL del form (ej: `https://tally.so/r/wke2LD`)

---

## Por cada persona que fotografíes

### 1. Sube las fotos a Google Drive
1. Crea una carpeta en Drive: `fotos/marta-lazienki`
2. Sube las fotos
3. Clic derecho en la foto → "Compartir" → "Cualquier persona con el link puede ver"
4. Copia el ID del archivo de la URL:
   ```
   https://drive.google.com/file/d/[ESTE_ES_EL_ID]/view
   ```
5. La URL directa para usar en el código:
   ```
   https://drive.google.com/uc?export=view&id=ESTE_ES_EL_ID
   ```

### 2. Crea la carpeta de sesión
```
sessions/
  nombre-lugar-YYYYMMDD/
    index.html
```

### 3. Duplica index.html y edita solo el objeto SESSION
```js
const SESSION = {
  name: "Marta",
  date: "06.05.2026",
  location: "Varsovia, Łazienki",
  photographer: "@tu_usuario",
  ig_url: "https://instagram.com/tu_usuario",
  phone_blik: "+48 XXX XXX XXX",
  tally_form_url: "https://tally.so/r/XXXXXXX",
  photos: [
    { id: 1, unlocked: true,  src: "https://drive.google.com/uc?export=view&id=ID1" },
    { id: 2, unlocked: true,  src: "https://drive.google.com/uc?export=view&id=ID2" },
    { id: 3, unlocked: false, src: "" },
    { id: 4, unlocked: false, src: "" },
  ]
};
```

### 4. Sube el cambio a GitHub
```bash
git add .
git commit -m "sesión: marta lazienki 06-05"
git push
```
Vercel detecta el cambio y despliega automáticamente en ~30 segundos.

### 5. Genera el QR
Abre `tu-url.vercel.app/admin`, ingresa los datos de la sesión y descarga el QR.  
Muéstralo en tu teléfono o imprímelo en tarjetas.

---

## Flujo en la calle

```
Tomas la foto
    ↓
Muestras el QR en tu teléfono (desde /admin)
    ↓
La persona escanea → ve su landing page
    ↓
Descarga 1-2 fotos gratis
    ↓
Publica en historia + te etiqueta
    ↓
Te llega email de Tally con el link
    ↓
Subes el resto de fotos a Drive, actualizas su index.html
    ↓
Ella ve todas sus fotos · tú ganas visibilidad
```

---

## Desbloquear fotos manualmente

Cuando alguien te etiqueta:
1. Verifica que el link de la historia es real
2. En su `index.html`, cambia `unlocked: false` → `unlocked: true` para las fotos adicionales
3. Agrega la URL de Drive en `src`
4. Sube el cambio a GitHub — en 30 segundos está visible

---

## Costos

| Herramienta | Plan | Costo |
|---|---|---|
| GitHub | Free | 0 zł |
| Vercel | Hobby | 0 zł |
| Google Drive | 15 GB | 0 zł |
| Tally.so | Free (100 respuestas/mes) | 0 zł |
| **Total** | | **0 zł** |

Si superas 100 respuestas al mes en Tally → problema bonito, considera Tally Pro (29 USD/mes) o usa Google Forms.

---

## Tips para Instagram

- **Fotografía en horas doradas** (1h después del amanecer, 1h antes del ocaso)
- **Máximo 3 fotos en la galería desbloqueada** — que sean las mejores, no las más fáciles
- **Responde cada mención en historias** — convierte cada etiqueta en una conversación
- **Guarda tus mejores trabajos para tu propio feed** — el feed es tu portafolio
- **Consistencia > cantidad** — una foto excelente por semana > 7 fotos mediocres

---

*Sistema diseñado para fotógrafos independientes que quieren ganar visibilidad orgánica sin fricciones.*
