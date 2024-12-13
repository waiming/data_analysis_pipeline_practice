.PHONY: all clean


all: results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/sierra.png report


results/isles.dat: data/isles.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/abyss.dat: data/abyss.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/last.dat: data/last.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/sierra.dat: data/sierra.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@


results/figure/isles.png: results/isles.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/figure/abyss.png: results/abyss.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/figure/last.png: results/last.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/figure/sierra.png: results/sierra.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@


report: results/isles.dat results/abyss.dat results/last.dat results/sierra.dat
	quarto render report/count_report.qmd


clean:
	rm -f results/*.dat
	rm -f results/figure/*.png
	rm -f report/count_report.html
