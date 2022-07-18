% Objective: Compute Sigmoid function as defined in Methods (page 10).
%
% Copyright: Johannes Keyser <johannes.keyser@sport.uni-giessen.de>
% License: CC0-1.0 public domain dedication, see
%          <https://creativecommons.org/share-your-work/public-domain/cc0/>.
%
% SPDX-FileCopyrightText: 2022 Johannes Keyser
%
% SPDX-License-Identifier: CC0-1.0

function y = soa_Sigmoid(x)
    y = 1 ./ (1 + exp(-x));
end