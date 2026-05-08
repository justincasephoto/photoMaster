#!/bin/bash
set -e

cd ~/0_JustinCasePhoto/web

echo "Creating session directory..."
mkdir -p sessions/krzysztof-birthday-2026

echo "Copying template..."
cp index.html sessions/krzysztof-birthday-2026/index.html

echo "Updating session data..."
python3 << 'PYEOF'
import re

file_path = "sessions/krzysztof-birthday-2026/index.html"
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace SESSION block
old_session = r'const SESSION = \{[^}]+photos: \[[^\]]+\][^}]*\};'

new_session = '''const SESSION = {
  name: "Krzysztof",
  date: "30.04.2026",
  location: "Kraków, Birthday Party",
  photographer: "@justincasephoto",
  ig_url: "https://instagram.com/justincasephoto",
  phone_blik: "+48 XXX XXX XXX",
  tally_form_url: "https://tally.so/r/rj2ZbN",
  photos: [
    { id: 1, unlocked: true, src: "https://drive.google.com/uc?export=view&id=16UjeiNnp6h_cZG6DObOBijaMMI6yRTyS" },
    { id: 2, unlocked: true, src: "https://drive.google.com/uc?export=view&id=1WAKV4dXzSqd9cpa1qOU9b7N1w3-00EYV" },
    { id: 3, unlocked: true, src: "https://drive.google.com/uc?export=view&id=15deqf-TqM53Ua0nu7U5--QUjFE4t6_UY" },
    { id: 4, unlocked: true, src: "https://drive.google.com/uc?export=view&id=1JSoIVMwX-1Hrvv5pfT9CHCUIUPv-5tPG" },
    { id: 5, unlocked: true, src: "https://drive.google.com/uc?export=view&id=1_nbAYlzM_J74VWDuXCTGDJ5h7otR-nkd" },
    { id: 6, unlocked: true, src: "https://drive.google.com/uc?export=view&id=1MFXvrkrvk-fHAjhHxYRrDe9FJnfXBydY" },
    { id: 7, unlocked: true, src: "https://drive.google.com/uc?export=view&id=1IcW7A525FNm_XAoK77k1-J88ohi4z4Gd" },
    { id: 8, unlocked: true, src: "https://drive.google.com/uc?export=view&id=1drFI3W-PeF_1Wb0mmuuBMtJ2LQGIcmB1" },
    { id: 9, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1Ss4VWmgiWejL3rbrjUikcBPZ5wtMn2Px" },
    { id: 10, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1iMjnsQoIYwdKdWgGWH_hWFwZ2UGXA9Ya" },
    { id: 11, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1RScyhnQ_pmBZ2h6C5VzqHUtLdVrQbnxJ" },
    { id: 12, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1DOrt19R1fbbtlGGMUKH8ONHuLWQ5QmHo" },
    { id: 13, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1WO_4N7lX5sX6zZvRDPgCZS5O8nolNVS1" },
    { id: 14, unlocked: false, src: "https://drive.google.com/uc?export=view&id=13g2yxDB7VsqDTEq8IvJSYNltizqdwkTf" },
    { id: 15, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1IPoYpudOfDAOYvLKrYqAQa47CgTPbsqx" },
    { id: 16, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1juuLm4XDDMKHxh4fHIc7TqIIRrHpUxif" },
    { id: 17, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1J0YUngxjo3NjeDkGQy6k13tKNRWYK0i2" },
    { id: 18, unlocked: false, src: "https://drive.google.com/uc?export=view&id=195VJzL3orEk9gLtz2bLArFwQHvqqqdEj" },
    { id: 19, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1SIon9rnoVFXgSCwJYKeUe3JkxNGPmkuU" },
    { id: 20, unlocked: false, src: "https://drive.google.com/uc?export=view&id=18YzZLzn2epEbQHS_D2FALfriPpMQt4u7" },
    { id: 21, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1tebNEaZoGgq6xoG98_eGSMaPWADx4mYh" },
    { id: 22, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1e-8wUWdgoOW4Nc6GrQBOdB7rlVYrd6jK" },
    { id: 23, unlocked: false, src: "https://drive.google.com/uc?export=view&id=102b-eToW18FawjnS8CdbbZFRB0O-zdN9" },
    { id: 24, unlocked: false, src: "https://drive.google.com/uc?export=view&id=1H-U3ZYEqYFG9IdbufbVFOlORdzlJ4Rx-" }
  ]
};'''

content = re.sub(old_session, new_session, content, flags=re.DOTALL)

# Translate to English
translations = {
    'foto compartida': 'shared photo',
    'esto es para ti': "this is for you",
    'fotografía por': 'photography by',
    'un momento en la ciudad': 'a moment in the city',
    'seguir en instagram': 'follow on instagram',
    'tus fotos': 'your photos',
    'disponibles': 'available',
    'descarga': 'download',
    'etiquétame para ver': 'tag me to see',
    '¿te gustan? comparte en tu historia y etiqueta': 'like them? share on your story and tag',
    'para desbloquear las': 'to unlock the',
    'restantes': 'remaining',
    'todos los derechos reservados': 'all rights reserved',
    'galería': 'gallery',
    'desbloquear': 'unlock',
    'apoyar': 'support',
    'Desbloquea todas': 'Unlock all',
    'Tres pasos. Sin registro. Sin costo. Solo un momento en tu historia.': 'Three steps. No signup. No cost. Just a moment on your story.',
    'Descarga': 'Download',
    'una de las fotos disponibles en la galería. Toca la foto y pulsa': 'one of the available photos in the gallery. Tap the photo and press',
    'Publícala': 'Post it',
    'en tu historia de Instagram. Etiqueta': 'on your Instagram story. Tag',
    'Pega el link': 'Paste the link',
    'de tu historia aquí abajo. En minutos recibes acceso al resto.': 'of your story here. You will get access to the rest in minutes.',
    'Si te gustó': 'If you liked',
    'el trabajo': 'the work',
    'La fotografía callejera es un trabajo independiente. Una donación voluntaria me permite seguir en la calle con la cámara. Cualquier cantidad es bienvenida, ninguna es obligatoria.': 'Street photography is independent work. A voluntary donation allows me to continue on the street with my camera. Any amount is welcome, none is mandatory.',
    'donación por blik': 'donation via blik',
    'Polonia': 'Poland',
    'Una donación + etiqueta en tu historia te da acceso a': 'A donation + tag on your story gives you access to',
    'todas las fotos': 'all photos',
    'de tu sesión. Gracias por apoyar el trabajo independiente.': 'from your session. Thanks for supporting independent work.',
    'fotografía': 'photography'
}

for es, en in translations.items():
    content = content.replace(es, en)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Session file created successfully!")
PYEOF

echo ""
echo "✓ Session created: sessions/krzysztof-birthday-2026/"
echo ""
echo "Now commit and push:"
echo "  git add ."
echo "  git commit -m 'first real session: Krzysztof birthday'"
echo "  git push"
echo ""
echo "After deploy (30s), your session will be live at:"
echo "  https://photo-master-pink.vercel.app/sessions/krzysztof-birthday-2026/"
