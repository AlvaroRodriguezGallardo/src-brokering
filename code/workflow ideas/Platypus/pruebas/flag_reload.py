import argparse
import sys

# Configurar el analizador de argumentos
if len(sys.argv) > 1:
	parser = argparse.ArgumentParser(description='Procesar el flag --reload')
	parser.add_argument('--reload', type=str, choices=['True', 'False'], required=True, help='Especificar True o False para el flag --reload')

	# Analizar los argumentos de la línea de comandos
	args = parser.parse_args()

	# Capturar el valor del flag --reload
	reload_value = args.reload

	print(f"El valor de --reload es: {reload_value}")
else:
	print("Tienes que pasar un valor a --reload")
