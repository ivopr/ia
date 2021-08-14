function [net] = treinamento
    clc;
    clearvars;
    M = load('treinamento.txt');
    vet_entrada = M(:,1:3)';
    vet_desejado = M(:,4)';

    vmin = min(vet_entrada');
    vmax = max(vet_entrada');

    net = newff([vmin' vmax'], [10 20 1], {'tansig', 'tansig', 'purelin'}, 'trainlm');

    net.trainParam.epochs = 500;
    net.trainParam.goal = 1e-4;
    net.trainParam.lr = 0.01;
    net.trainParam.show = 5;

    net = train(net, vet_entrada, vet_desejado);
end