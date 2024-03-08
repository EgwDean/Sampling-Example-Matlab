fs = input('Enter the sampling frequency: ');

c = linspace(0, 2*pi, 100);

x = cos(c);
y = sin(c);

plot(x, y, 'b-', 'LineWidth', 2);

hold on;

point = 0;

sample_point = 0;

next = (2*pi)/100;

sample_next = pi*fs/5;

a = cos(point);
b = sin(point);

current_place = [cos(point), sin(point)];

dot = plot(a, b, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

sample_dot = plot(a, b, 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

title('Sampling of cos(0.04π^2t+π/2)');

for i = 1:10000

	point = point - next; 

	a = cos(point);
	b = sin(point);

	a0 = a;
	b0 = b;

	set(dot, 'XData', a, 'YData', b);

	sample_point = sample_point - sample_next;

	a = cos(sample_point);
	b = sin(sample_point);

	current_place = [a, b];

	set(sample_dot, 'XData', a, 'YData', b);

	if norm(current_place - [cos(0), sin(0)]) < 0.01

		plot(a0, b0, 'yo', 'MarkerSize', 10, 'MarkerFaceColor', 'y');
	end

	pause(0.1);

end

hold off;

axis equal;
